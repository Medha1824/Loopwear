import 'package:flutter/material.dart';
import 'package:loop_wear/product_card.dart';
import 'my_product.dart';
import 'navigation_drawer_widget.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Favourites', style: TextStyle(
            fontFamily: 'Philosopher', fontWeight: FontWeight.bold, color:Color(0xFF68514D))),
        backgroundColor: const Color(0xFFCCB7AE),
        centerTitle: true,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            mainAxisExtent: 360,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product:MyProducts.allProducts[index]);
          },
        ),
      ),
    );
  }
}
