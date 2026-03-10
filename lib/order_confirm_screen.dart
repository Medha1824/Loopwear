import 'package:flutter/material.dart';
import 'navigation_bar.dart';
class OrderConfirmScreen extends StatelessWidget {
  const OrderConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check_circle_outline,
                color:const Color(0xFF9F7F88) , size: 100),
            SizedBox(height: 20),
            Text(
              'Order Confirmed!',
              style: TextStyle(
                fontSize: 24,
                color:const Color(0xFF9F7F88),
                fontWeight: FontWeight.bold,
                fontFamily: 'Philosopher',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Thank you for your purchase!',
              style: TextStyle(
                fontSize: 16,
               color: const Color(0xFF9F7F88),
              ),
            ),
          ],
        ),
      ),
    );
  }
}