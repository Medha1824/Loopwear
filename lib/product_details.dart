import 'package:flutter/material.dart';
import 'package:loop_wear/available_size.dart';
import 'package:loop_wear/favourite_icon.dart';
import 'package:loop_wear/product.dart';
import 'cart_controller.dart';
import 'loaders.dart';

class ProductDetails extends StatefulWidget{
   final Product product;
  const ProductDetails( {super.key, required this.product, });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String? selectedColor;
  String? selectedSize;
  int ssize = -1;
  List<String> size=['36','38','40'];
  late bool hasSizes = size.isNotEmpty;
  int selectedImageIndex=0;
  int count=0;
  bool isClicked=false;

  @override
  void initState() {
    super.initState();
    selectedSize = null;
    selectedColor = null;
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      widget.product.image1,
      widget.product.image2,
      widget.product.image3
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(0xFF9F7F88)),
            backgroundColor: Colors.transparent,
            actions: [
              FavouriteIcon(id: widget.product.id ),
            ],
          ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width:double.infinity,
                color: Colors.white,
                child:ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child:Image.asset(
                      images[selectedImageIndex],fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                color:Colors.white,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.product.title,style:TextStyle(
                          fontSize: 23,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9F7F88),
                        ),),
                        Text(widget.product.price,style:TextStyle(
                          fontSize: 23,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9F7F88),
                        ),),
                      ],
                    ),
                    SizedBox(height:14),
                    Text(widget.product.description
                        ,style:TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9F7F88),
                          fontFamily: 'Roboto',
                        )
                    ),
                    SizedBox(height:14),
                    if(int.parse(widget.product.id) >= 116 && int.parse(widget.product.id) <= 121) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Available Sizes", style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9F7F88),
                          ),),
                        ],
                      ),
                      SizedBox(height: 7),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                      Row(
                      children: List.generate(size.length, (index) {
                      return GestureDetector(
                      onTap: () {
                      setState(() {
                      ssize = index;
                      selectedSize = size[index];
                      });
                      },
                      child: Container(
                      margin: EdgeInsets.only(right: 16),
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(
                      color: ssize == index ? Color(0xFF9F7F88) : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xFF9F7F88)),
                      ),
                      child: Center(
                      child: Text(size[index], style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ssize == index ? Colors.white : Color(
                      0xFF9F7F88),
                      fontSize: 16,
                      )),
                      ),
                      ),
                      );
                      }),
                      )
                          ]
                      ),
                    ]
                    else if(widget.product.category!='EcoWear') ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Available Sizes", style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9F7F88),
                          ),),
                        ],
                      ),
                      SizedBox(height: 7),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AvailableSize(onSizeSelected: (size) {
                                setState(() {
                                selectedSize = size;
                                });
                                },)
                          ]
                      )
                    ],
                    SizedBox(height:14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Available Colors",style:TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9F7F88),
                        ),),
                      ],
                    ),
                    SizedBox(height:7),
                    Row(
                      children: List.generate(images.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = "color_$index";
                              selectedImageIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedImageIndex == index
                                    ? Color(0xFF9F7F88)
                                    : Colors.transparent,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                images[index],
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height:100),
                  ],
                )
              )
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            color: Color(0xFF9F7F88),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (count > 0) {
                          setState(() {
                            count--;
                          });
                        }
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xFF9F7F88),
                        child: Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                    Text(
                      "$count",
                      style: TextStyle(
                        color: Color(0xFF9F7F88),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          count++;
                        });
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xFF9F7F88),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  bool productHasSizes = (int.parse(widget.product.id) >= 116 &&
                      int.parse(widget.product.id) <= 121) ||
                      widget.product.category != 'EcoWear';

                  if (selectedColor == null ||
                      (productHasSizes && selectedSize == null)) {
                    TLoaders.customToast(
                      context: context,
                      message:
                      "Select color${productHasSizes ? ' and size' : ''}",
                    );
                    return;
                  }

                  if (count <= 0) {
                    TLoaders.customToast(
                      context: context,
                      message: "Select quantity",
                    );
                    return;
                  }

                  CartController.instance.productQuantityInCart.value = count;

                  CartController.instance.addToCart(
                    context: context,
                    product: widget.product,
                    selectedColor: selectedColor!,
                    selectedSize: productHasSizes ? selectedSize! : '',
                    quantity: count,
                    cartImage: images[selectedImageIndex],
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                ),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(color: Color(0xFF9F7F88)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
