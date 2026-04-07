import 'dart:convert';
import 'package:get/get.dart';
import 'package:loop_wear/storage_utility.dart';
import 'loaders.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteController extends GetxController {
  //static FavouriteController get instance=> Get.find();

  final favourites = <String, bool>{}.obs;
  String? _userId;
  @override
  void onInit() {
    super.onInit();
    //initFavourites();
  }

  void initFavourites() {
    final json = TLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
        storedFavourites.map((key, value) => MapEntry(key, value as bool)),
      );
    }
  }

  bool isFavourite(String id) {
    return favourites[id] ?? false;
  }
  void setUser(String userId) {
    _userId = userId;

    favourites.clear();

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('wishlist')
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        favourites[doc.id] = true;
      }
    });
  }
  void toggleFavouriteProduct(BuildContext context, String id) async {
    if (_userId == null) return;

    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(_userId)
        .collection('wishlist')
        .doc(id);

    if (favourites.containsKey(id)) {
      favourites.remove(id);
      await docRef.delete();

      TLoaders.customToast(
        context: context,
        message: 'Your wishlist item has been removed',
      );
    } else {
      favourites[id] = true;
      await docRef.set({});

      TLoaders.customToast(
        context: context,
        message: 'Product has been added to the wishlist',
      );
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favourites', encodedFavourites);
  }
}
