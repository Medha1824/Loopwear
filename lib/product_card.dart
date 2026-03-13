import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loop_wear/product.dart';
import 'package:loop_wear/product_details.dart';

class ProductCard extends StatefulWidget{
  final Product product;
  const ProductCard({super.key, required this.product,});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetails(product: widget.product),));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white60,
        ),

        child:Column(
            children:[
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                child: Image.asset(widget.product.image1,
                  height:200,
                  width:double.infinity,
                  fit:BoxFit.cover,
                ),
              ),
              SizedBox(height:5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.title,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9F7F88),
                    ),
                  ),
                  Text(widget.product.price ,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9F7F88),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: .end,
                    children: [
                      IconButton(onPressed: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                        icon: isClicked? Icon(CupertinoIcons.heart_fill,color:Colors.red,):Icon(CupertinoIcons.heart,color:Color(0xFF9F7F88),),
                      ),
                      IconButton(onPressed: () {  },
                        icon: Icon(CupertinoIcons.cart,color:Color(0xFF9F7F88)),
                      )
                    ],
                  )
                ],
              )
            ]
        ),

      ),
    );
  }
}