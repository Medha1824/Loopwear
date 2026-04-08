import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Forgot extends StatefulWidget {
  Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {

  TextEditingController email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  Future<void> resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:const Color(0xFF9F7F88),
          content: Text("Password reset email sent",style: TextStyle(color: Colors.white),
        ),),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:const Color(0xFF9F7F88),
          content: Text("Error: $e", style: TextStyle(color: Colors.white),
        ),),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _inputField(context),
              ]
          ),
        ),
      ),
    );
  }
  _header(context) {
    return Column(
        children: [
          Text("Forgot Password",
            style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF9F7F88),
            ),
          ),
        ]
    );
  }
  _inputField(context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            TextField(
              controller: email,
              style: TextStyle(
                color: Colors.white,),
                decoration: InputDecoration(
                  hintText: "Enter email",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,),
                filled: true,
                fillColor: const Color(0xFF9F7F88),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
              ),),
              SizedBox(height: 20),


            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => resetPassword(context),
              child: Text("Send Reset Link",style: TextStyle(fontSize: 20,color: Colors.white),
              ),
        style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(vertical: 20),
        backgroundColor:  const Color (0xFF9F7F88),),
            )
          ],


    );
  }
}



