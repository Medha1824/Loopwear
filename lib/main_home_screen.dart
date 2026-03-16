import 'package:flutter/material.dart';
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
  Widget buildCard(String name,String image) => Column(
    children: [
      SizedBox(height: 6),
      Container(
        height: 230,
        width: 330,
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Material(
            child: Ink.image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuildProducts(categoryName: name),
                    ),
                  );
                },
              ),
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
              height: 245,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 6),
                  buildCard("Summer Collection","assets/photos/summer.jpg"),
                  SizedBox(width: 12),
                  buildCard("Winter Collection","assets/photos/winter.jpg"),
                  SizedBox(width: 6),
                  buildCard("Winter Collection","assets/photos/tree.jpg"),
                  SizedBox(width: 6),
                ],
              ),
            ),
            SizedBox(height: 20),
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
                  List<String> categoryImages = [
                    "assets/photos/Men/blazar_4_green.jpg",
                    "assets/photos/Women/coord_7_multi.jpg",
                    "assets/photos/Kids/regular_3_yellow.jpg",
                    "assets/photos/Eco/scarf_5_1.jpg",
                    "assets/photos/Summer/summer_6_purple.jpg",
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: .start,
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
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: MyProducts.allProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 360,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: MyProducts.allProducts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
