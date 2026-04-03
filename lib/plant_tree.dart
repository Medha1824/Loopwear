import 'package:flutter/material.dart';
import 'package:loop_wear/cart_screen.dart';
import 'package:loop_wear/product.dart';

import 'cart_controller.dart';
import 'loaders.dart';

class PlantTree extends StatefulWidget {
  const PlantTree({super.key});

  @override
  State<PlantTree> createState() => _PlantTreeState();
}

class _PlantTreeState extends State<PlantTree> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF9F7F88)),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/photos/plant.jpg",
                height: 180,
                width: 180,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Plant a Tree",
              style: TextStyle(
                color: Color(0xFF9F7F88),
                fontSize: 32,
                fontFamily: 'Anydore',
              ),
            ),
            Text(
              "Help the planet with every tree you plant",
              style: TextStyle(
                color: Color(0xFF9F7F88),
                fontSize: 16,
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Each tree you plant helps reforest the planet. "
              "Add it to your cart and in your every order "
              "we will contribute to planting a real tree in your name."
              "Planting each tree will cost you just Tk 10.",
              style: TextStyle(
                color: Color(0xFF9F7F88),
                fontSize: 14,
                fontFamily: 'Philosopher',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (count > 0) count--;
                    });
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.remove, color: Color(0xFF9F7F88)),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "$count",
                  style: TextStyle(
                      color: Color(0xFF9F7F88),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.add, color: Color(0xFF9F7F88)),
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                    if (count <= 0) {
                      TLoaders.customToast(
                        context: context,
                        message: "Select quantity",
                      );
                      return;
                    }

                    CartController.instance.addToCart(
                      context: context,
                      product: Product(
                        id: 'tree',
                        title: 'Tree Donation',
                        price: '10',
                        image1: 'assets/photos/plant.jpg',
                        image2: 'assets/photos/plant.jpg',
                        image3: 'assets/photos/plant.jpg',
                        description: 'Plant a tree',
                        category: 'EcoWear',
                      ),
                      selectedColor: 'N/A',
                      selectedSize: 'N/A',
                      quantity: count,
                      cartImage: 'assets/photos/plant.jpg',
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9F7F88),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Add $count Tree${count > 1 ? 's' : ''} to Cart",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
