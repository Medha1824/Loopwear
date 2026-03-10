import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String searchQuery;

  const ProductDetailsScreen({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCCB7AE),
        title: const Text(
          'Our Product Details',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Philosopher',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dress.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              'Product related to',
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Philosopher',
              ),
            ),
          ],
        ),
      ),
    );
  }
}