import 'package:flutter/material.dart';
import 'package:loop_wear/checkout_screen.dart';
import 'navigation_drawer_widget.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9F7F88),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('My Cart',style: TextStyle(color: Colors.white,fontFamily: 'Philosopher',fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
        body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
           const Spacer(),
            SizedBox(
              width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff9f7f88),
                    padding: const EdgeInsets.symmetric(vertical: 7),
                  ),
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutScreen()),
                  );},
                  child: const Text(
                    'Check out',
                    style: TextStyle(color:Colors.white,fontSize: 25),
                  ),
                ),
              ),
          ],
        ),
      ),

    );
  }
}