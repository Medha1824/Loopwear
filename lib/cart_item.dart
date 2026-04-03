import 'package:loop_wear/product.dart';

class CartItemModel {
  String productId;
  String title;
  double price;
  String image1;
  String image2;
  String image3;
  String variationId;
  int quantity;
  String cartImage;
  Map<String, dynamic>? selectedVariation;

  CartItemModel({
    required this.productId,
    required this.quantity,
    required this.image1,
    required this.image2,
    required this.image3,
    this.price = 0.0,
    this.title = '',
    required this.variationId,
    this.selectedVariation,
    required this.cartImage,
  });

  static CartItemModel empty() => CartItemModel(
    productId: '',
    quantity: 0,
    image1: '',
    image2: '',
    image3: '',
    variationId: '',
    cartImage: '',
    
  );

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'quantity': quantity,
      'variationId': variationId,
      'selectedVariation': selectedVariation,
      'cartImage' : cartImage,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      title: json['title'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      quantity: json['quantity'],
      variationId: json['variationId'] ?? '',
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, dynamic>.from(json['selectedVariation'])
          : null,
      cartImage:json['cartImage'] ?? '',
    );
  }
}