import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loop_wear/product_details.dart';

import 'navigation_drawer_widget.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Favourites', style: TextStyle(
            fontFamily: 'Philosopher', fontWeight: FontWeight.bold, color:Color(0xFF68514D))),
        backgroundColor: const Color(0xFFCCB7AE),
        centerTitle: true,
      ),
      body:
      GridB(),
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({super.key});

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Product name here",
      "price": "Tk 1230",
      "image": "https://t4.ftcdn.net/jpg/06/83/67/09/360_F_683670903_y142G40Y2n7Zt22YIyVWUKS2etD8USw9.jpg",
    },
    {
      "title": "Product name here",
      "price": "Tk 1230",
      "image": "https://t4.ftcdn.net/jpg/06/83/67/09/360_F_683670903_y142G40Y2n7Zt22YIyVWUKS2etD8USw9.jpg",
    },
    {
      "title": "Product name here",
      "price": "Tk 1230",
      "image": "https://t4.ftcdn.net/jpg/06/83/67/09/360_F_683670903_y142G40Y2n7Zt22YIyVWUKS2etD8USw9.jpg",
    },
    {
      "title": "Product name here",
      "price": "Tk 1230",
      "image": "https://t4.ftcdn.net/jpg/06/83/67/09/360_F_683670903_y142G40Y2n7Zt22YIyVWUKS2etD8USw9.jpg",
    },
    {
      "title": "Product name here",
      "price": "Tk 1230",
      "image": "https://t4.ftcdn.net/jpg/06/83/67/09/360_F_683670903_y142G40Y2n7Zt22YIyVWUKS2etD8USw9.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: gridMap.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 360,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (BuildContext context, int index) =>
          InkWell(
            onTap:(){
          Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetails(product:gridMap[index]),));
          },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white60,
        ),

        child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  "${gridMap.elementAt(index)['image']}",
                  height: 200,
                  //width:double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${gridMap.elementAt(index)['title']}",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7F665F),
                      ),
                    ),
                    Text("${gridMap.elementAt(index)['price']}",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7F665F),
                      ),
                    ),

                    Row(
                      children: [
                        IconButton(onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.heart_fill, color: Colors.red,),
                        ),
                        IconButton(onPressed: () {},
                          icon: Icon(
                              CupertinoIcons.cart, color: Color(0xFF7F665F)),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]
        ),
      ),
      ),
    );
  }
}
