import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loop_wear/navigation_bar.dart';
import 'package:loop_wear/login_screen.dart';


import 'cart_controller.dart';
import 'favourite_controller.dart';

class SignUpScreen  extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Future<UserCredential?> signUp(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Sign up error: $e');
      return null;
    }
  }
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> register() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email & Password required")),
      );
      return;
    }

    try {
      final userCredential = await signUp(email.text, password.text);

      if (userCredential == null) {
        throw Exception("Signup failed");
      }

      final user = userCredential.user;

      if (user != null) {
        // new user
        CartController.instance.clearCart();
        CartController.instance.setUser(user.uid);

        final favController = Get.find<FavouriteController>();
        favController.setUser(user.uid);
      }


      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );

    } on FirebaseAuthException catch (e) {
      String message = "Signup failed";

      if (e.code == 'email-already-in-use') {
        message = "This email is already in use";
      } else if (e.code == 'invalid-email') {
        message = "Invalid email format";
      } else if (e.code == 'weak-password') {
        message = "Password should be at least 6 characters";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        margin: EdgeInsets.all(24) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputFields(context),
            _loginInfo(context),
          ],
        ),
      ),
    )
    );
  }
  _header(context){
    return Column(
        children: [
          Text(
            "Create Account",
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,
                color: const Color (0xFF9F7F88)),
          ),
          Text("Enter details to get started",
                style: TextStyle( color: const Color(0xFF9F7F88)),
          ),

        ],
    );
  }
  _inputFields(context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          TextField(
            controller: email,
            decoration: InputDecoration(
            hintText: "Email",
              hintStyle: TextStyle(
                color: Colors.white,
              ),
            filled: true,
              fillColor: const Color(0xFF9F7F88),
            prefixIcon: Icon(Icons.email_outlined,color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: password,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              filled: true,
              fillColor: const Color(0xFF9F7F88),
              prefixIcon: Icon(Icons.lock,color: Colors.white),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
            ),
            obscureText: true,
          ),

          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async{
            await register();},
             child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 20,color: Colors.white),
          ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor:  const Color (0xFF9F7F88),

              )
          )
        ],
    );
  }
  _loginInfo(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?",style: TextStyle(color: const Color (0xFF9F7F88)),),
        TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );}, child: Text(
                "Login",
                style: TextStyle(color: const Color (0xFF9F7F88)),),
        ),
      ],
    );
  }
}