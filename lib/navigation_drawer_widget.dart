import 'package:flutter/material.dart';
import 'build_products.dart';
class NavigationDrawerWidget extends StatefulWidget{

  const NavigationDrawerWidget({super.key});

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {

  final padding =EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Container(
        color:Color(0xFFCCB7AE),
      child:SafeArea(
        child: ListView(
          children: [
            Padding(
              padding:EdgeInsets.all(16),
              child:Text("Categories",style:TextStyle(fontFamily: 'Philosopher',
                  fontWeight:FontWeight.bold,fontSize:25,color: Color(0xFF806760)),),
            ),
            ListTile(
              title: Text("All Products"),
              leading:Icon(Icons.shopping_bag_outlined),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BuildProducts(categoryName:"All Products")));
              },
            ),
            ExpansionTile(
              title: Text("Men"),
            leading:Icon(Icons.man),
            childrenPadding: EdgeInsets.only(left:60),
            children: [
              ListTile(
                title:Text("Shirts"),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuildProducts(categoryName:"Men",subsection: "Shirts",)));
                },
              ),
              ListTile(
                title:Text("Pants"),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuildProducts(categoryName:"Men",subsection: "Pants",)));
                },
              ),
              ListTile(
                title:Text("T Shirts"),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuildProducts(categoryName:"Men",subsection: "T Shirts",)));
                },
              ),
              ListTile(
                title:Text("Sweat Shirts"),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuildProducts(categoryName:"Men",subsection: "Sweat Shirts",)));
                },
              ),
            ],
            ),
            ExpansionTile(
              title: Text("Women"),
              leading:Icon(Icons.woman),
              childrenPadding: EdgeInsets.only(left:60),
              children: [
                ListTile(
                  title:Text("Tops"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Women",subsection: "Tops",)));
                  },
                ),
                ListTile(
                  title:Text("Pants"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Women",subsection: "Pants",)));
                  },
                ),
                ListTile(
                  title:Text("Co-ord Set"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Women",subsection: "Co-ord Set",)));
                  },
                ),
                ListTile(
                  title:Text("Cardigan"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Women" ,subsection: "Cardigan")));
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Kids"),
              leading:Icon(Icons.child_friendly),
              childrenPadding: EdgeInsets.only(left:60),
              children: [
                ListTile(
                  title:Text("Co-ords"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Kids" ,subsection: "Co-ords")));
                  },
                ),
                ListTile(
                  title:Text("Jeans"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Kids" ,subsection: "Jeans")));
                  },
                ),
                ListTile(
                  title:Text("Play-wears"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Kids" ,subsection: "Play wears")));
                  },
                ),
                ListTile(
                  title:Text("Jackets"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Kids" ,subsection: "Jackets")));
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Eco-wear"),
              leading:Icon(Icons.recycling),
              childrenPadding: EdgeInsets.only(left:60),
              children: [
                ListTile(
                  title:Text("Hats"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"EcoWear" ,subsection: "Hats")));
                  },
                ),
                ListTile(
                  title:Text("Bags and Tote bags"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"EcoWear",subsection: "Bags and Tote bags")));
                  },
                ),
                ListTile(
                  title:Text("Sandals And Shoes"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"EcoWear",subsection: "Sandals and Shoes")));
                  },
                ),
                ListTile(
                  title:Text("Scarves"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"EcoWear",subsection: "Scarves")));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}