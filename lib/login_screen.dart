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
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
              color: const Color(0xFF9F7F88)),
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
              color: Colors.white,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
            filled: true,
            fillColor: const Color(0xFF9F7F88),

            prefixIcon: Icon(Icons.email_outlined,color: Colors.white),
          ),
          ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: const Color(0xFF9F7F88),
            prefixIcon: Icon(Icons.lock,color: Colors.white),
          ),
          obscureText: true,
        ),
        Align(
          alignment:Alignment.centerRight,
            child: TextButton(
              onPressed: (){},
              child: Text(
                "Forgot password?",
                style: TextStyle(color: const Color(0xFF9F7F88)),
              ),
            ),
          ),

        SizedBox(height: 20),
        ElevatedButton(
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );},
            child: Text(
              "Login",
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
  _signup(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",style: TextStyle(color: const Color (0xFF9F7F88)),),
        TextButton(onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpPage()),
        );}, child: Text("Sign Up",style: TextStyle(color: const Color (0xFF9F7F88)),
            ),
        ),
      ],
    );
  }
}