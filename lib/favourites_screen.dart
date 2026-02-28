import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Favourites',style: TextStyle(fontFamily: 'Philosopher',fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0xFFCCB7AE),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.heart_broken,
              color: Colors.red[400],
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'My heart already break for flutter!',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}