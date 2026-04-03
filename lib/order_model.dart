import 'cart_item.dart';

class OrderModel {
  String orderId;
  double totalPrice;
  int totalItems;
  DateTime date;
  List<CartItemModel> items;

  OrderModel({
    required this.orderId,
    required this.totalPrice,
    required this.totalItems,
    required this.date,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'totalItems': totalItems,
      'date': date.toIso8601String(),
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      totalPrice: (json['totalPrice'] ?? 0.0).toDouble(),
      totalItems: json['totalItems'] ?? 0,
      date: DateTime.parse(json['date']),
      items: (json['items'] as List)
          .map((e) => CartItemModel.fromJson(e))
          .toList(),
    );
  }
}