import 'package:flutter/material.dart';
import 'package:loop_wear/storage_utility.dart';
import 'package:loop_wear/welcome_screen.dart';
import 'package:get/get.dart';

import 'favourite_controller.dart';


class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    TLocalStorage.instance().init('loopwear');

    Get.lazyPut<FavouriteController>(() => FavouriteController());
    return Scaffold(
      backgroundColor: const Color(0xFF9F7F88),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _getlogo()),
              const SizedBox(
                height: 20,
                width:20,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _getlogo(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Image.asset("assets/logoo.png",height:200,width:200),
        const Text(
          'Loop wear',
          style: TextStyle(
          fontFamily:'Philosopher',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle:FontStyle.italic,
          color: Colors.white,),
        ),
      ],
    );
  }
}