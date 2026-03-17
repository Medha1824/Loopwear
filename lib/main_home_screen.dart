import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loop_wear/plant_tree.dart';
import 'package:loop_wear/product_card.dart';
import 'package:loop_wear/search_screen.dart';
import 'build_products.dart';
import 'my_product.dart';
import 'navigation_drawer_widget.dart';
class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  late PageController pageController;
  late Timer timer;
  late int currentPage =0;
  @override
  void initState(){
    super.initState();
    pageController=PageController();
    timer=Timer.periodic(Duration(seconds:3), (timer){
      if(currentPage<2) {
        currentPage++;
      }
      else{
        currentPage=0;
      }
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn);
    });
  }
  @override
  void dispose(){
  timer.cancel();
  pageController.dispose();
    super.dispose();
  }
  Widget buildCard(String name, String image){
      return Column(
        children: [
          SizedBox(height: 6),
          Container(
            height: 230,
            width: double.infinity,
            color: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Material(
                child: Ink.image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () {
                      if (name == "Tree") {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => PlantTree()));
                      }
                      else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BuildProducts(categoryName: name),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
   bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Color(0xFF9F7F88),
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
              height: 250,
              child: PageView(
                    controller:pageController,
                onPageChanged: (index){
                      currentPage=index;
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: buildCard("Summer Collection","assets/photos/summer.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: buildCard("Winter Collection","assets/photos/winter.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: buildCard("Tree","assets/photos/tree.jpg"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: .start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      color: Color(0xFF9F7F88),
                      fontFamily: 'Philosopher',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 130,
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
                  List<String> categoryImages = [
                    "assets/photos/Men/blazar_4_green.jpg",
                    "assets/photos/Women/coord_7_multi.jpg",
                    "assets/photos/Kids/regular_3_yellow.jpg",
                    "assets/photos/Eco/scarf_5_1.jpg",
                    "assets/photos/Summer/summer_6_purple_1.jpg",
                    "assets/photos/Women/sweater_4_pink.jpg",
                  ];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuildProducts(
                                  categoryName: categoryNames[index],
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              categoryImages[index],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          categoryNames[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            color: Color(0xFF9F7F88),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:8.0,left:8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Sellers",
                    style: TextStyle(
                      color: Color(0xFF9F7F88),
                      fontFamily: 'Philosopher',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          isClicked=!isClicked;
                        });
                      },
                      child: Text(
                        isClicked?"View less":"View all",
                        style: TextStyle(
                          color: Color(0xFF9F7F88),
                          fontFamily: 'Roboto',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: isClicked? MyProducts.best.length:3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 360,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: MyProducts.best[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
