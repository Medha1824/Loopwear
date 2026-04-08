import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loop_wear/navigation_bar.dart';
import 'package:loop_wear/login_screen.dart';
import 'package:get_storage/get_storage.dart';

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
  TextEditingController username=TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword= TextEditingController();

  Future<void> register() async {
    if (username.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:const Color(0xFF9F7F88),
              content: Text("Username is required",
                  style: TextStyle(color: Colors.white),),),
      );
      return;
    }
    if (email.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:const Color(0xFF9F7F88),
          content: Text("Email & Password required",
                                style: TextStyle(color: Colors.white),),
      ),);
      return;
    }
    if (password.text != confirmpassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:const Color(0xFF9F7F88),
            content: Text("Passwords do not match",
              style: TextStyle(color: Colors.white),),),
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
        await user.updateDisplayName(username.text);
        CartController.instance.clearCart();
        CartController.instance.setUser(user.uid);
        final favController = Get.find<FavouriteController>();
        favController.setUser(user.uid);
        final box = GetStorage();
        box.write('username', username.text);
        box.write('email', email.text);
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
          SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF9F7F88),
                  ),
                ),
                Text(
                  "Enter details to get started",
                  style: TextStyle(
                    color: const Color(0xFF9F7F88),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

  _inputFields(context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height:40,
            child: TextField(
            controller: username,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Username",
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              filled: true,
              fillColor: const Color(0xFF9F7F88),
              prefixIcon: Icon(Icons.person ,color: Colors.white),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
            ),
            //obscureText: true,
          ),),
          SizedBox(height: 15,),
          SizedBox(height: 40,
          child:TextField(
            controller: email,
            style: TextStyle(color: Colors.white),
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
          ),),
          SizedBox(height: 15,),
          SizedBox(height: 40,
          child:
          TextField(
            controller: password,
            style: TextStyle(color: Colors.white),
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
          ),),
          SizedBox(height: 15,),
          SizedBox(height: 40,
            child:
            TextField(
            controller: confirmpassword,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Confirm Password",
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
          ),),

          SizedBox(height: 15,),
          ElevatedButton(onPressed: () async {
            await register(
            );},
            child: SizedBox(height: 40,
            child: Center(
             child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 20,color: Colors.white),
          ),),),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 5),
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