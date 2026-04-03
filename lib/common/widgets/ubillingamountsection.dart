import 'package:flutter/material.dart';

class UBillingAmountSection extends StatelessWidget {
  final double subtotal;
  final double discount;
  final double shipping;
  final double total;

  const UBillingAmountSection({
    super.key,
    required this.subtotal,
    required this.discount,
    required this.shipping,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add some padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(
                color: Color(0xFF9F7F88),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // space between title and rows
            _row(
              "Subtotal",
              subtotal,
              style: const TextStyle(
                color: Color(0xFF9F7F88),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            _row("Discount", -discount,
              style: const TextStyle(
                color: Color(0xFF9F7F88),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            _row("Shipping", shipping,
              style: const TextStyle(
                color: Color(0xFF9F7F88),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Divider(),
            _row("Total", total,
                style: const TextStyle(
                  color: Color(0xFF9F7F88),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),


                isBold: true),
          ],
        ),
      ),
    );
  }

  Widget _row(String title, double value,
      {bool isBold = false, TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Apply the style if passed, otherwise default
          Text(
            title,
            style: style ?? TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            "\$${value.toStringAsFixed(0)}",
            style: style ?? TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}