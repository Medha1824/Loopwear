import 'package:flutter/material.dart';

class UBillingAddressSection extends StatelessWidget {
  final VoidCallback? onChange;

  const UBillingAddressSection({super.key, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery Address',
          style: TextStyle(
              color: Color(0xFF9F7F88),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 5,
          child: ListTile(
            leading: const Icon(Icons.location_on, color: Color(0xFF9F7F88)),
            title: const Text('Mirpur 2',
                style: TextStyle(
                    color: Color(0xFF9F7F88),
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            subtitle: const Text('Rupnagar, Dhaka, Bangladesh',
                style: TextStyle(
                    color: Color(0xFF9F7F88),
                    fontSize: 14)),
            trailing: TextButton(
              onPressed: onChange,
              child: const Text('Change',
                  style: TextStyle(
                      color: Color(0xFF9F7F88),
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }
}