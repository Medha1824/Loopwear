import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCB7AE),
      body: Center(
        child: Text(
          "This is Sign In Page",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}