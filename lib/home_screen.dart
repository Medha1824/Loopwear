import 'package:flutter/material.dart';
import 'package:loop_wear/account_screen.dart';
import 'package:loop_wear/cart_screen.dart';
import 'package:loop_wear/favourites_screen.dart';
import 'package:loop_wear/main_home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myIndex=0;
  List<Widget> widgetList= const[
    MainHomeScreen(),
    FavouritesScreen(),
    CartScreen(),
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
          items: const [
        BottomNavigationBarItem(icon:Icon(Icons.home) , label:'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label:'Favourites'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label:'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label:'Account'),
      ]),
    );
  }
}