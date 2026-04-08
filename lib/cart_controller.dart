import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loop_wear/cart_item.dart';
import 'package:loop_wear/loaders.dart';
import 'package:loop_wear/product.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  //RxInt productQuantityInCart = 1.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  RxBool loading = true.obs;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _cartSubscription;

  double get subtotal => totalCartPrice.value;

  @override
  void onInit() {
    super.onInit();
    final user = _auth.currentUser;
    if (user != null) setUser(user.uid);
  }
  void setUser(String uid) {
    // Cancel previous listener if exists
    _cartSubscription?.cancel();

    // Clear old cart
    cartItems.clear();
    noOfCartItems.value = 0;
    totalCartPrice.value = 0.0;

    // Listen to new user's cart
    loading.value = true;
    _cartSubscription = _db
        .collection('users')
        .doc(uid)
        .collection('cart')
        .snapshots()
        .listen((snapshot) {
      cartItems.clear();
      for (var doc in snapshot.docs) {
        cartItems.add(CartItemModel.fromJson(doc.data()));
      }
      updateCartTotals();
      loading.value = false;
    });
  }
  void clearCart() {
    cartItems.clear();
    noOfCartItems.value = 0;
    totalCartPrice.value = 0.0;

    _cartSubscription?.cancel();
    _cartSubscription = null;
  }
  void addToCart({
    required BuildContext context,
    required Product product,
    required String selectedColor,
    required String selectedSize,
    required int quantity,
    required String cartImage,
  }) {
    if (quantity < 1) {
      TLoaders.customToast(
        context: context,
        message: "Select Quantity",
      );
      return;
    }

    String variationId = "${selectedColor}_${selectedSize}";

    CartItemModel newItem = CartItemModel(
      productId: product.id,
      title: product.title,
      price: double.tryParse(
          product.price.replaceAll(RegExp(r'[^0-9.]'), '')
      ) ?? 0.0,
      image1: product.image1,
      image2: product.image2,
      image3: product.image3,
      quantity: quantity,
      variationId: variationId,
      selectedVariation: {
        "color": selectedColor,
        "size": selectedSize,
      },
      cartImage: cartImage,
    );

    int index = cartItems.indexWhere((item) =>
    item.productId == newItem.productId &&
        item.variationId == newItem.variationId);

    String uid = _auth.currentUser!.uid;

    if (index != -1) {
      cartItems[index].quantity += newItem.quantity;
      _db.collection('users').doc(uid)
          .collection('cart')
          .doc(newItem.productId + newItem.variationId)
          .update({'quantity': cartItems[index].quantity});
    } else {
      cartItems.add(newItem);
      _db.collection('users').doc(uid)
          .collection('cart')
          .doc(newItem.productId + newItem.variationId)
          .set(newItem.toJson(), SetOptions(merge: true));
    }

    updateCartTotals();
    //productQuantityInCart.value = 1;

    TLoaders.customToast(
      context: context,
      message: "Added to cart",
    );

    for (var item in cartItems) {
      print("${item.title} | ${item.selectedVariation} | Qty: ${item.quantity}");
    }
  }

  void decreaseQuantity(BuildContext context, CartItemModel item) {
    String uid = _auth.currentUser!.uid;

    if (item.quantity > 1) {
      item.quantity--;
      _db.collection('users')
          .doc(uid)
          .collection('cart')
          .doc(item.productId + item.variationId)
          .update({'quantity': item.quantity});
    } else {
      cartItems.remove(item);
      _db.collection('users')
          .doc(uid)
          .collection('cart')
          .doc(item.productId + item.variationId)
          .delete();
      TLoaders.customToast(
        context: context,
        message: "Item removed from cart",
      );
    }
    updateCartTotals();
  }

  void loadCartFromFirebase() {
    String uid = _auth.currentUser!.uid;
    loading.value = true;

    _db.collection('users').doc(uid).collection('cart')
        .snapshots()
        .listen((snapshot) {
      cartItems.clear();
      for (var doc in snapshot.docs) {
        cartItems.add(CartItemModel.fromJson(doc.data()));
      }
      updateCartTotals();
      loading.value = false;
    });
  }

  void updateCartTotals() {
    int totalItems = 0;
    double totalPrice = 0.0;

    for (var item in cartItems) {
      totalItems += item.quantity;
      totalPrice += item.price * item.quantity;
    }

    noOfCartItems.value = totalItems;
    totalCartPrice.value = totalPrice;
  }

  Future<void> placeOrder(BuildContext context) async {
    String uid = _auth.currentUser!.uid;

    if (cartItems.isEmpty) {
      TLoaders.customToast(
        context: context,
        message: "Cart is empty",
      );
      return;
    }

    String orderId = DateTime.now().millisecondsSinceEpoch.toString();

    final order = {
      'orderId': orderId,
      'totalPrice': totalCartPrice.value,
      'totalItems': noOfCartItems.value,
      'date': DateTime.now().toIso8601String(),
      'items': cartItems.map((e) => e.toJson()).toList(),
    };

    await _db
        .collection('users')
        .doc(uid)
        .collection('orders')
        .doc(orderId)
        .set(order);

    cartItems.clear();

    await _db
        .collection('users')
        .doc(uid)
        .collection('cart')
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.delete();
      }
    });

    updateCartTotals();

    TLoaders.customToast(
      context: context,
      message: "Order placed successfully",
    );
  }
}