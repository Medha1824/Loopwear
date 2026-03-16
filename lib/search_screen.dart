import 'package:flutter/material.dart';
import 'build_products.dart';
import 'my_product.dart';
import 'product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> categoryNames = [
    "Men",
    "Women",
    "Kids",
    "EcoWear",
    "Summer Collection",
    "Winter Collection",

  ];

  List filterProducts = MyProducts.allProducts;
  void searchProduct(String value) {

    String val = value.toLowerCase().trim();

    if (val == "men" ||
        val == "women" ||
        val == "kids" ||
        val == "ecowear" ||
        val == "summer collection" ||
        val == "winter collection"
      ) {

      String matchedCategory = categoryNames.firstWhere(
              (cat) => cat.toLowerCase() == val,
          orElse: () => "nothing");

      if (matchedCategory.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BuildProducts(categoryName: matchedCategory),
          ),
        );
        return;
      }
    }
    setState(() {
      filterProducts = MyProducts.allProducts
          .where((product) =>
          product.title.toLowerCase().contains(val))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9F7F88),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Search",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            /// SEARCH BAR
            TextField(
              controller: searchController,
              onSubmitted: searchProduct,
              decoration: InputDecoration(
                hintText: "Search Products",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

             const SizedBox(height: 20),


         Row(
              children: const [
                Text(
                  "Suggestions",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryNames.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
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
                      child: Chip(
                        label: Text(categoryNames[index]),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),


            Row(
              children: const [
                Text(
                  "Recommend",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Expanded(
              child: GridView.builder(
                itemCount: filterProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 360,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: filterProducts[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}