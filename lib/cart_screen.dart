import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCCB7AE),
        title: const Text('My Cart'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.shopping_cart,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            // Static Cart Items UI
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.brown[100],
                  child: const Icon(Icons.shopping_bag),
                ),
                title: const Text('Item Name'),
                subtitle: const Text('Quantity: 1'),
                trailing: const Text('0'),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.brown[100],
                  child: const Icon(Icons.shopping_bag),
                ),
                title: const Text('Item Name'),
                subtitle: const Text('Quantity: 1'),
                trailing: const Text('0'),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.brown[100],
                  child: const Icon(Icons.shopping_bag),
                ),
                title: const Text('Item Name'),
                subtitle: const Text('Quantity: 1'),
                trailing: const Text('0'),
              ),
            ),

            const Spacer(),

            // Checkout button (just UI)
            SizedBox(
              width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCCB7AE),
                    padding: const EdgeInsets.symmetric(vertical: 50),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Checkout',
                    style: TextStyle(fontSize: 37),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}