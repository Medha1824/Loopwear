import 'package:flutter/material.dart';
import 'package:loop_wear/navigation_bar.dart';
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
          TextField(
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
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          }, child: Text(
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