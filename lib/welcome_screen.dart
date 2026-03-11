import 'package:flutter/material.dart';
//import 'package:loop_wear/home_screen.dart';
import 'package:loop_wear/login_screen.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body:Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logoo.png',
                    height: 120,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome to Loop wear',
                    style: const TextStyle(
                      fontFamily:'Philosopher',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFCCB7AE),
                    ),
                  ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color (0xFFCCB7AE),
                      ),
      
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text("Skip"),
      
                    ),
            ],
          )
        )
      ),
    );
  }
}
