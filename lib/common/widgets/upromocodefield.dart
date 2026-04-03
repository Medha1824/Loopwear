import 'package:flutter/material.dart';

class UPromoCodeField extends StatelessWidget {
  const UPromoCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Have a promo code? Enter here',
        suffixIcon: TextButton(
          onPressed: () {
            // apply promo logic
          },
          child: Text('Apply'),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}