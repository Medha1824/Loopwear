import 'package:flutter/material.dart';
import 'package:loop_wear/my_product.dart';
import 'package:loop_wear/product_card.dart';

class BuildProducts extends StatelessWidget{
  final String categoryName;
  final String? subsection;

  const BuildProducts({super.key, required this.categoryName,this.subsection});

  @override
  Widget build(BuildContext context) {
    late List products;

    if (categoryName == "All Products") {
      products = MyProducts.allProducts;
    } else if (categoryName == "Men") {
      products = MyProducts.men;
    } else if (categoryName == "Women") {
      products = MyProducts.women;
    }
    else if (categoryName == "Kids") {
      products = MyProducts.kids;
    }
    else if (categoryName == "EcoWear") {
      products = MyProducts.ecoWear;
    }
    else if (categoryName == "Summer Collection") {
      products = MyProducts.summer;
    }
    else if (categoryName == "Winter Collection") {
      products = MyProducts.winter;
    }

    return Scaffold(
      appBar: AppBar(title: Text(
          subsection!=null? "$categoryName - $subsection":categoryName, style: TextStyle(
          fontFamily: 'Philosopher', fontWeight: FontWeight.bold, color:Color(0xFF68514D)))),
      body:GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 360,
          crossAxisCount:2 ,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: products.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,  index) {
          final product=products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }

  }
