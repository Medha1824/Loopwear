import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loop_wear/product_details.dart';
import 'package:loop_wear/search_screen.dart';
import 'navigation_drawer_widget.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  Widget buildCard() => Column(
    children: [
      SizedBox(height:6),
      Container(
        height: 250,
        width: 400,
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Material(
            child: Ink.image(
              image: NetworkImage(
                'https://img.freepik.com/free-photo/shop-clothing-clothes-shop-hanger-modern-shop-boutique_1150-8886.jpg?semt=ais_hybrid&w=740&q=80',
              ),
              fit: BoxFit.cover,
              child: InkWell(onTap: () {}),
            ),
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Color(0xFFCCB7AE),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "LoopWear",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontFamily: 'Anydore',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 27, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 266,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 6),
                  buildCard(),
                  SizedBox(width: 12),
                  buildCard(),
                  SizedBox(width: 12),
                  buildCard(),
                  SizedBox(width: 6),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Categories",
              style: TextStyle(
                color: Color(0xFF7F665F),
                fontFamily: 'Philosopher',
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  List<String> categoryNames = [
                    "Men",
                    "Women",
                    "Kids",
                    "EcoWear",
                    "Summer Collection",
                    "Winter Collection",
                  ];
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                              "https://www.mjunction.in/wp-content/uploads/2020/09/Dummy.jpg",
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          categoryNames[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            color: Color(0xFF7F665F),
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: .start,
                children: [
                  Text(
                    "Best Sellers",
                    style: TextStyle(
                      color: Color(0xFF7F665F),
                      fontFamily: 'Philosopher',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridB(),
            ),
          ],
        ),
      ),
    );
  }
}

class GridB extends StatefulWidget{
  const GridB({super.key});

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String,dynamic>> gridMap=[
    {
      "title":"Product name here",
      "price":"Tk 1230",
      "image":"https://t4.ftcdn.net/jpg/06/83/67/09/360_F_683670903_y142G40Y2n7Zt22YIyVWUKS2etD8USw9.jpg",
    },
    {
      "title":"Product name here",
      "price":"Tk 1230",
      "image":"https://t4.ftcdn.net/jpg/06/83/67/09/360_F_683670903_y142G40Y2n7Zt22YIyVWUKS2etD8USw9.jpg",
    },
    {
      "title":"Product name here",
      "price":"Tk 1230",
      "image":"https://t4.ftcdn.net/jpg/06/83/67/09/360_F_683670903_y142G40Y2n7Zt22YIyVWUKS2etD8USw9.jpg",
    },
    {
      "title":"Product name here",
      "price":"Tk 1230",
      "image":"https://t4.ftcdn.net/jpg/06/83/67/09/360_F_683670903_y142G40Y2n7Zt22YIyVWUKS2etD8USw9.jpg",
    },
    {
      "title":"Product name here",
      "price":"Tk 1230",
      "image":"https://t4.ftcdn.net/jpg/06/83/67/09/360_F_683670903_y142G40Y2n7Zt22YIyVWUKS2etD8USw9.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
       return GridView.builder(
         physics:const  BouncingScrollPhysics(),
         shrinkWrap: true,
         itemCount: gridMap.length,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             mainAxisExtent: 360,
               crossAxisCount:2 ,
             mainAxisSpacing: 15,
             crossAxisSpacing: 15,
           ),
           itemBuilder: (BuildContext context,int index)=>InkWell(
               onTap:(){
                 Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetails(product:gridMap[index]),));
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
                     child: Image.network(
                       "${gridMap.elementAt(index)['image']}",
                       height:200,
                       //width:double.infinity,
                       fit:BoxFit.cover,
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
                             IconButton(onPressed: () {  },
                               icon: Icon(CupertinoIcons.heart,color:Color(0xFF7F665F) ,),
                             ),
                             IconButton(onPressed: () {  },
                               icon: Icon(CupertinoIcons.cart,color:Color(0xFF7F665F)),
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
