import 'package:flutter/material.dart';
import 'package:loop_wear/available_size.dart';

class ProductDetails extends StatefulWidget{
  final Map<String,dynamic> product;
  const ProductDetails({super.key,required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF7F665F)),
          backgroundColor: Colors.transparent,
        ),
      body: Column(
        children: [
          Container(
            width:double.infinity,
            height:420,
            color: Colors.white,
            child:ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child:Image.network('https://t4.ftcdn.net/jpg/06/83/67/09/360_F_683670903_y142G40Y2n7Zt22YIyVWUKS2etD8USw9.jpg',fit: BoxFit.cover),
            ),


          ),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height:400,
            color:Colors.white,
            child:Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product Name ",style:TextStyle(
                      fontSize: 23,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7F665F),
                    ),),
                    Text("Tk 1230",style:TextStyle(
                      fontSize: 23,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7F665F),
                    ),),
                  ],
                ),
                SizedBox(height:14),
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
                    ,style:TextStyle(
                      fontSize: 14,
                    )
                ),
                SizedBox(height:14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Available Sizes",style:TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7F665F),
                    ),),
                  ],
                ),
                SizedBox(height:7),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    AvailableSize(size:"38"),
                    AvailableSize(size:"40"),
                    AvailableSize(size:"42"),
                    AvailableSize(size:"44"),
                ]
                ),
                SizedBox(height:14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Available Colors",style:TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7F665F),
                    ),),
                  ],
                ),
                SizedBox(height:7),
                Row(
                  children:[
                    CircleAvatar(
                      radius:16,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(width:8),
                    CircleAvatar(
                      radius:16,
                      backgroundColor: Colors.black,
                    ),
                    SizedBox(width:8),
                    CircleAvatar(
                      radius:16,
                      backgroundColor: Colors.blueGrey,
                    ),
                    SizedBox(width:8),
                  ]
                )
              ],
            )
          )
        ],
      ),
     bottomSheet: Container(
       padding: EdgeInsets.symmetric(horizontal: 20),
       width:double.infinity,
       height: 90,
       decoration: BoxDecoration(
         color:Color(0xFFCCB7AE),
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(40),
           topRight: Radius.circular(40),
         ),
       ),
       child:Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Container(
             width:120,
             height:40,
             padding: EdgeInsets.symmetric(horizontal: 4),
             decoration: BoxDecoration(
               color:Colors.white,
               borderRadius: BorderRadius.circular(50),
             ),
             child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 InkWell(
                   onTap:()=>setState((){
                     if(count>0) {
                       count--;
                     }
                   }),
                   child: CircleAvatar(
                     radius:18,
                     backgroundColor:Color(0xFFCCB7AE),
                     child:Icon(Icons.remove),
                   ),
                 ),
                 Text("$count",style:TextStyle(color: Color(0xFFCCB7AE),fontSize: 20,fontWeight: FontWeight.bold)),
                 InkWell(
                   onTap:()=>setState((){
                     count++;
                   }),
                   child: CircleAvatar(
                     radius:18,
                     backgroundColor:Color(0xFFCCB7AE),
                     child:Icon(Icons.add),
                   ),
                 ),


               ],
             ),
           ),
           ElevatedButton(
               onPressed:(){},

             style:ButtonStyle(
               backgroundColor:
               WidgetStatePropertyAll(Colors.white),
             ),
             child: Text("Add to Cart",style:
               TextStyle(color: Color(0xFF65514C)),),
           )
         ],
       )


     ),
    );
  }
}
