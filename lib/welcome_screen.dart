import 'package:flutter/material.dart';
import 'package:loop_wear/login_screen.dart';

class WelcomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _getlogo()),
                const SizedBox(
                  height: 20,
                  width:20,
                ),
                _footer(context),
          ],
        )
      )
    );
  }
  Widget _getlogo(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Image.asset("assets/logoo.png",height:200,width:200),
        const Text(
          'Welcome to Loop wear',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.brown),
        ),
      ],
    );
  }
  _footer(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );},
            child: Text(
              "Skip",
              style: TextStyle(fontSize: 10,color: Colors.brown),
            ),

        )
      ],
    );
  }
}
