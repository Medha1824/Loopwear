import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loop_wear/product_card.dart';
import 'favourite_controller.dart';
import 'my_product.dart';
import 'navigation_drawer_widget.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});

  final controller = Get.find<FavouriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Wishlist', style: TextStyle(
            fontFamily: 'Philosopher',
            fontWeight: FontWeight.bold,
            color: Colors.white)),
        backgroundColor: const Color(0xFF9F7F88),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),

      body:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(() {
          var favProducts = MyProducts.allProducts
              .where((p) => controller.favourites.containsKey(p.id))
              .toList();

          if (favProducts.isEmpty) {
            return Center(
              child: Text(
                "No items in wishlist",
                style: TextStyle(fontSize: 16,color:Color(0xFF9F7F88) ),
              ),
            );
          }

          return GridView.builder(
            itemCount: favProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              mainAxisExtent: 360,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: favProducts[index]);
            },
          );
        }
        ),
      ),
    );
  }
}
