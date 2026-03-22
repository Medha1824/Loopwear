import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loop_wear/wishlist_screen.dart';

class FavouriteIcon extends StatefulWidget{
  const FavouriteIcon({super.key});

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      setState(() {
        isClicked = !isClicked;
      });
    },
      icon: isClicked? Icon(CupertinoIcons.heart_fill,color:Colors.red,):
      Icon(CupertinoIcons.heart,color:Color(0xFF9F7F88),),
    );
  }
}