import 'package:flutter/material.dart';
import 'package:loop_wear/navigation_bar.dart';
import 'package:loop_wear/sign_up_screen.dart';

class LoginPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
          body:Container(
            margin: EdgeInsets.all(24) ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _inputField(context),
                _forgotPassword(context),
                _signup(context),
              ],
            )
          )
        )
    );
  }
  _header(context){
    return Column(
      children: [
        Text("Enter your credential to login",
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),
        ),
      ],
    );
  }
  _inputField(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            hintStyle: TextStyle(
              color: Colors.brown,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
            filled: true,
            prefixIcon: Icon(Icons.email_outlined),
          ),
          ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(
              color: Colors.brown,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );},
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20,color: Colors.brown),
            ),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(vertical: 16),
            )
        )
      ],
    );
  }
  _forgotPassword(context){
    return TextButton(onPressed: (){},
        child: Text("Forgot password?",style: TextStyle(color: Colors.brown),
        ),
    );
  }
  _signup(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",style: TextStyle(color: Colors.brown),),
        TextButton(onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpPage()),
        );}, child: Text("Sign Up",style: TextStyle(color: Colors.brown),
            ),
        ),
      ],
    );
  }
}