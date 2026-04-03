import 'package:flutter/material.dart';

class UCartItems extends StatelessWidget {
  final bool showAddRemoveButtons;

  const UCartItems({super.key, this.showAddRemoveButtons = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.network(
              'https://via.placeholder.com/50',
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Bata Ankle Socks',
                    style: TextStyle(
                        color: Color(0xFF9F7F88),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    'Black & White',
                    style: TextStyle(
                        color: Color(0xFF9F7F88),
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            if (showAddRemoveButtons)
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove,
                          color: Color(0xFF9F7F88))),
                  const Text(
                    '1',
                    style: TextStyle(
                        color: Color(0xFF9F7F88),
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add,
                          color: Color(0xFF9F7F88))),
                ],
              ),
          ],
        ),
      ),
    );
  }
}