import 'package:flutter/material.dart';
import 'package:loop_wear/welcome_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCB7AE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logoo.png',
              height:120,
            ),
            const SizedBox(height: 10),
            const Text(
              'Loop wear',
              style: TextStyle(
                fontFamily:'Philosopher',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle:FontStyle.italic,
                color: Colors.white,
              ),
            ),

          ],
        ),
      ),
    );
  }
}