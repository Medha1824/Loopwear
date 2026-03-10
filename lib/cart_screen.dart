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
        body: SafeArea(
      child:Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: const Color(0xFFF0E4E7),
              child: Icon(
                Icons.shopping_cart,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

           Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:  const Color(0xFFF0E4E7),
                  child: const Icon(color:const Color(0xFF9F7F88),Icons.shopping_bag),
                ),
                title: const Text(
                  'Item Name',
                  style: TextStyle(
                    color: Color(0xFF9F7F88),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: const Text(
                  'Quantity: 1',
                  style: TextStyle(
                    color:Color(0xFF9F7F88),
                  ),
                ),
                trailing: const Text(
                  '0',
                  style: TextStyle(
                    color:Color(0xFF9F7F88),

                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:  const Color(0xFFF0E4E7),
                  child: const Icon(color:const Color(0xFF9F7F88),Icons.shopping_bag),
                ),
                title: const Text(
                  'Item Name',
                  style: TextStyle(
                    color: Color(0xFF9F7F88),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: const Text(
                  'Quantity: 1',
                  style: TextStyle(
                    color:Color(0xFF9F7F88),

                  ),
                ),
                trailing: const Text(
                  '0',
                  style: TextStyle(
                    color:Color(0xFF9F7F88),

                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:  const Color(0xFFF0E4E7),
                  child: const Icon(color:const Color(0xFF9F7F88),Icons.shopping_bag),
                ),
                title: const Text(
                  'Item Name',
                  style: TextStyle(
                    color: Color(0xFF9F7F88),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: const Text(
                    'Quantity: 1',
                style: TextStyle(
                    color:Color(0xFF9F7F88),

                ),
            ),
                trailing: const Text(
                    '0',
                  style: TextStyle(
                    color:Color(0xFF9F7F88),

                ),
              ),
            ),
            ),
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
        ),
    );
  }
}