import 'package:flutter/material.dart';
//import 'package:loop_wear/home_screen.dart';
import 'package:loop_wear/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 210),
                  Image.asset('assets/logoo.png', height: 120,),
                  const SizedBox(height: 1),
                  const Text('Welcome to Loop wear',
                    style: const TextStyle(fontFamily: 'Philosopher',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF9F7F88),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9F7F88),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text("Continue"),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
