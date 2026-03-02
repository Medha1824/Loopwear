import 'package:flutter/material.dart';
import 'package:loop_wear/order_confirm_screen.dart';
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCCB7AE),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Philosopher',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address
            const Text(
              'Delivery Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Mirpur 2'),
                subtitle: const Text('Rupnagar, Dhaka, Bangladesh'),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('Change'),
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Credit Card'),

                trailing: TextButton(
                  onPressed: () {},
                  child: const Text( 'Select'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/images/bkash.png',
                  height: 30,
                  width: 30,
                ),
                title: const Text('Bkash Payment'),

                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('Select'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/images/nagod.png',
                  height: 30,
                  width: 30,
                ),
                title: const Text('Nagod Payment'),

                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('Select'),
                ),
              ),
            ),
            const SizedBox(height: 16),


            // Cart Summary
            const Text(
              'Cart Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Item 1'),
                    subtitle: const Text('Quantity: 2'),
                    trailing: const Text('৳200'),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Item 2'),
                    subtitle: const Text('Quantity: 1'),
                    trailing: const Text('৳150'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Total Price
            Card(
              color: Colors.grey[200],
              child: ListTile(
                title: const Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: const Text(
                  '৳350',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Checkout Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderConfirmScreen ()),
                  );
                },
                child: const Text(
                  'Place Order',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}