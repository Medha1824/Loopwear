import 'package:flutter/material.dart';

class AvailableSize extends StatefulWidget{
  final String size;
  const AvailableSize({super.key, required this.size});

  @override
  State<AvailableSize> createState() => _AvailableSizeState();
}

class _AvailableSizeState extends State<AvailableSize> {
  bool isSelected=false;
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: (){
      setState((){
        isSelected=!isSelected;
      });
    },
    child: Container(
      margin:EdgeInsets.only(right:16),
      width:40,
      height:30,
        decoration:BoxDecoration(
          color:isSelected? Color(0xFFCCB7AE): Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          border:Border.all(color:Color(0xFFCCB7AE)),
        ),
    child:Center(
      child: Text(widget.size,style:TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF65514C),
        fontSize: 16,
      )),
    ),
    ),
  );
}