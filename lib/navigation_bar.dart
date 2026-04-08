import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loop_wear/account_screen.dart';
import 'package:loop_wear/cart_screen.dart';
import 'package:loop_wear/wishlist_screen.dart';
import 'package:loop_wear/main_home_screen.dart';

import 'cart_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myIndex=0;
  List<Widget> widgetList= [
    const MainHomeScreen(),
    FavouritesScreen(),
    const CartScreen(),
     AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: myIndex,children: widgetList,),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 15,
        backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          iconSize: 25,
          selectedItemColor: Color(0xFF9F7F88),
          unselectedItemColor: Color(0xFFE6DEE1),
          onTap: (index){
            setState(() {
              myIndex=index;
            });
          },
          currentIndex: myIndex,
          items: [
        const BottomNavigationBarItem(icon:Icon(Icons.home) , label:'Home'),
        const BottomNavigationBarItem(icon: Icon(Icons.favorite), label:'Wishlist'),
            BottomNavigationBarItem(
              icon: Obx(() => Stack(
                children: [
                  const Icon(Icons.shopping_cart),
                  if (CartController.instance.noOfCartItems.value > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.red,
                        child: Text(
                          '${CartController.instance.noOfCartItems.value}',
                          style: const TextStyle(fontSize: 8, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              )),
              label: 'Cart',
            ),
        const BottomNavigationBarItem(icon: Icon(Icons.person), label:'Account'),
      ]),
    );
  }
}