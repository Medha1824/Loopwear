import 'package:flutter/material.dart';

class UBillingPaymentSection extends StatelessWidget {
  final void Function(String)? onSelect;

  const UBillingPaymentSection({super.key, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPaymentCard(context, Icons.payment, 'Credit Card'),
        _buildPaymentCard(context, null, 'Bkash', imageAsset: 'assets/images/bkash.png'),
        _buildPaymentCard(context, null, 'Nagod', imageAsset: 'assets/images/nagod.png'),
      ],
    );
  }

  Widget _buildPaymentCard(BuildContext context, IconData? icon, String title, {String? imageAsset}) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      child: ListTile(
        leading: icon != null
            ? Icon(icon, color: const Color(0xFF9F7F88))
            : Image.asset(imageAsset!, height: 30, width: 30),
        title: Text(title,
            style: const TextStyle(
                color: Color(0xFF9F7F88), fontWeight: FontWeight.bold, fontSize: 16)),
        trailing: TextButton(
          onPressed: () {
            if (onSelect != null) onSelect!(title);
          },
          child: const Text('Select',
              style: TextStyle(
                  color: Color(0xFF9F7F88),
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
