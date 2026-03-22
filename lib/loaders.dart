import 'package:flutter/material.dart';

class TLoaders{
  static hideSnackBar(BuildContext context) => ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static customToast({required BuildContext context,required String message}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(elevation:0,
        duration: const Duration(seconds: 2),
        backgroundColor:Colors.transparent,
        content:Container(
          padding: const EdgeInsets.all(8.0),
          margin:const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color:Colors.grey[200],
          ),
          child:Center(
              child:Text(message,style:TextStyle(color: Color(0xFF9F7F88),fontSize: 14),)
          ),
        ),
      )
    );
  }

}