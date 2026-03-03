import 'package:flutter/material.dart';
import 'package:loop_wear/home_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFCCB7AE),
        body:Center(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logoo.png',
                    height: 50,
                  ),

                ]
            )
        ),
    );
  }
}