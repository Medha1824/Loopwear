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
          'Product Details',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Philosopher',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Hey there',

          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Philosopher',
          ),
        ),
      ),
    );
  }
}