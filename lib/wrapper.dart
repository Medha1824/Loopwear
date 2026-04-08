import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loop_wear/login_screen.dart';
import 'package:loop_wear/navigation_bar.dart';

import 'package:loop_wear/wrapper.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              return MyHomePage();
            } else {
              return LoginPage();
            }
          }),
    );
  }
}
