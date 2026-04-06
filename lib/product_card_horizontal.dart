import 'package:flutter/material.dart';
import 'package:loop_wear/cart_controller.dart';
import 'cart_item.dart';

class ProductCardHorizontal extends StatelessWidget {
  final CartItemModel cartItem;

  const ProductCardHorizontal({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final CartController controller = CartController.instance;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white60,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              cartItem.cartImage,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9F7F88),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Color: ${cartItem.selectedVariation?['color'] ?? '-'} | Size: ${cartItem.selectedVariation?['size'] ?? '-'}",
                  style: const TextStyle(fontSize: 14, color: Color(0xFF9F7F88)),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            CartController.instance.decreaseQuantity(context,cartItem);
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: const Color(0xFF9F7F88),
                            child: const Icon(Icons.remove, color: Colors.white, size: 18),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "${cartItem.quantity}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9F7F88)),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            cartItem.quantity++;
                            controller.updateCartTotals();
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: const Color(0xFF9F7F88),
                            child: const Icon(Icons.add, color: Colors.white, size: 18),
                          ),
                        ),
                      ],
                    ),
                        Text(
                          "Tk ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9F7F88)),
                        ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}