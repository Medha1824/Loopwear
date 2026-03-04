import 'package:flutter/material.dart';
import 'package:loop_wear/home_screen.dart';
import 'package:loop_wear/login_screen.dart';

class SignUpPage extends StatelessWidget {
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
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.brown),
          ),
          Text("Enter details to get started"),
        ],
    );
  }
  _inputFields(context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
            hintText: "Email",
              hintStyle: TextStyle(
                color: Colors.brown,
              ),
            filled: true,
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                color: Colors.brown,
              ),
              filled: true,
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
            ),
            obscureText: true,
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              hintText: "Confirm Password",
              hintStyle: TextStyle(
                color: Colors.brown,
              ),
              filled: true,
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
              ),
              obscureText: true,
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          }, child: Text(
              "Sign Up",
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
  _loginInfo(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?",style: TextStyle(color: Colors.brown),),
        TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );}, child: Text(
                "Login",
                style: TextStyle(color: Colors.brown),),
        ),
      ],
    );
  }
}