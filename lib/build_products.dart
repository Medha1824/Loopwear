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
    } else if (categoryName == "Men"&& subsection=="Shirts")
      products = MyProducts.shirts;
    else if (categoryName == "Men" && subsection== "Sweat Shirts")
      products = MyProducts.sweatersM;
    else if (categoryName == "Men" && subsection== "Blazar")
      products = MyProducts.blazers;
    else if (categoryName == "Men"&& subsection== "T Shirts")
      products = MyProducts.tShirts;
    else if (categoryName == "Men" && subsection== "Pants")
      products = MyProducts.pants;
    else if (categoryName == "Men") {
      products = MyProducts.men;
    } else if (categoryName == "Women" && subsection == "Tops")
      products = MyProducts.tops;
    else if (categoryName == "Women" && subsection == "Bottoms")
      products = MyProducts.bottoms;

    else if (categoryName == "Women" && subsection == "Dresses")
      products = MyProducts.dresses;

    else if (categoryName == "Women" && subsection == "Cardigan")
      products = MyProducts.sweatersW;

    else if (categoryName == "Women" && subsection == "Co-ords")
      products = MyProducts.coords;

    else if (categoryName == "Women") {
      products = MyProducts.women;
    }
    else if (categoryName == "Kids" && subsection == "Regular Wears")
      products = MyProducts.kidsRegular;
    else if (categoryName == "Kids" && subsection == "Night Wears")
      products = MyProducts.kidsNight;
    else if (categoryName == "Kids" && subsection == "Denims")
      products = MyProducts.kidsDenims;
    else if (categoryName == "Kids" && subsection == "Co-ords")
      products = MyProducts.kidsCoOrds;
    else if (categoryName == "Kids" && subsection == "Jackets")
      products = MyProducts.kidsJackets;
    else if (categoryName == "Kids")
      products = MyProducts.kids;
    else if (categoryName == "EcoWear" && subsection=="Hats") {
      products = MyProducts.hats;
    }else if (categoryName == "EcoWear"&& subsection=="Bags") {
      products = MyProducts.bags;
    }else if (categoryName == "EcoWear"&& subsection=="Foot Wear") {
      products = MyProducts.footWear;
    }else if (categoryName == "EcoWear"&& subsection=="Scarves") {
      products = MyProducts.scarves;
    } else if (categoryName == "EcoWear") {
      products = MyProducts.ecoWear;
    }
    else if (categoryName == "Summer Collection") {
      products = MyProducts.summer;
    }
    else if (categoryName == "Winter Collection") {
      products = MyProducts.winter;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color(0xFF9F7F88)),
          title: Text(
          subsection!=null? "$categoryName - $subsection":categoryName, style: TextStyle(
          fontFamily: 'Philosopher', fontWeight: FontWeight.bold, color:Color(0xFF9F7F88)))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
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
      ),
    );
  }

  }
