import 'package:flutter/material.dart';
import 'build_products.dart';
class NavigationDrawerWidget extends StatefulWidget{

  const NavigationDrawerWidget({super.key});

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  bool isExpanded=false;
  final padding =EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Container(
        color:Color(0xFF9F7F88),
      child:SafeArea(
        child: ListView(
          children: [
            Padding(
              padding:EdgeInsets.all(16),
              child:Text("Categories",style:TextStyle(fontFamily: 'Philosopher',
                  fontWeight:FontWeight.bold,fontSize:26,color: Colors.white),),
            ),
            ListTile(
              title: Text("All Products",style:TextStyle(color: Colors.white70)),
              leading:Icon(Icons.shopping_bag,color: Colors.white70,),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BuildProducts(categoryName:"All Products")));
              },
            ),
            ExpansionTile(
              title: Text("Men",style:TextStyle(color: Colors.white70)),
            leading:Icon(Icons.man,color: Colors.white70,),
            childrenPadding: EdgeInsets.only(left:60),
            trailing: Icon(isExpanded?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,color: Colors.white70,),
            onExpansionChanged: (expand){
                setState(() {
                  isExpanded=expand;
                });
            },
            children: [
              ListTile(
                title:Text("Shirts",style:TextStyle(color: Colors.white70)),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuildProducts(categoryName:"Men",subsection: "Shirts",)));
                },
              ),
              ListTile(
                title:Text("Pants",style:TextStyle(color: Colors.white70)),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuildProducts(categoryName:"Men",subsection: "Pants",)));
                },
              ),
              ListTile(
                title:Text("T Shirts",style:TextStyle(color: Colors.white70)),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuildProducts(categoryName:"Men",subsection: "T Shirts",)));
                },
              ),
              ListTile(
                title:Text("Blazar",style:TextStyle(color: Colors.white70)),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuildProducts(categoryName:"Men",subsection: "Blazar",)));
                },
              ),
              ListTile(
                title:Text("Sweat Shirts",style:TextStyle(color: Colors.white70)),
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
              title: Text("Women",style:TextStyle(color: Colors.white70)),
              leading:Icon(Icons.woman,color: Colors.white70,),
              childrenPadding: EdgeInsets.only(left:60),
              trailing: Icon(isExpanded?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,color: Colors.white70,),
              onExpansionChanged: (expand){
                setState(() {
                  isExpanded=expand;
                });
              },
              children: [
                ListTile(
                  title:Text("Tops",style:TextStyle(color: Colors.white70)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Women",subsection: "Tops",)));
                  },
                ),
                ListTile(
                  title:Text("Dresses",style:TextStyle(color: Colors.white70)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Women",subsection: "Dresses",)));
                  },
                ),
                ListTile(
                  title:Text("Co-ord Set",style:TextStyle(color: Colors.white70)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Women",subsection: "Co-ords",)));
                  },
                ),
                ListTile(
                  title:Text("Bottoms",style:TextStyle(color: Colors.white70)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Women" ,subsection: "Bottoms")));
                  },
                ),
                ListTile(
                  title:Text("Cardigan",style:TextStyle(color: Colors.white70)),
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
              title: Text("Kids",style:TextStyle(color: Colors.white70)),
              leading:Icon(Icons.child_friendly,color: Colors.white70,),
              childrenPadding: EdgeInsets.only(left:60),
              trailing: Icon(isExpanded?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,color: Colors.white70,),
              onExpansionChanged: (expand){
                setState(() {
                  isExpanded=expand;
                });
              },
              children: [
                ListTile(
                  title:Text("Co-ords",style:TextStyle(color: Colors.white70)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Kids" ,subsection: "Co-ords")));
                  },
                ),
                ListTile(
                  title:Text("Regular wears",style:TextStyle(color: Colors.white70)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Kids" ,subsection: "Regular Wears")));
                  },
                ),
                ListTile(
                  title:Text("Denims",style:TextStyle(color: Colors.white70)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Kids" ,subsection: "Denims")));
                  },
                ),
                ListTile(
                  title:Text("Night wears",style:TextStyle(color: Colors.white70)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"Kids" ,subsection: "Night Wears")));
                  },
                ),
                ListTile(
                  title:Text("Jackets",style:TextStyle(color: Colors.white70)),
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
              title: Text("Eco-wear",style:TextStyle(color: Colors.white70)),
              leading:Icon(Icons.recycling,color: Colors.white70,),
              childrenPadding: EdgeInsets.only(left:60),
              trailing: Icon(isExpanded?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,color: Colors.white70,),
              onExpansionChanged: (expand){
                setState(() {
                  isExpanded=expand;
                });
              },
              children: [
                ListTile(
                  title:Text("Hats",style:TextStyle(color: Colors.white70)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"EcoWear" ,subsection: "Hats")));
                  },
                ),
                ListTile(
                  title:Text("Bags",style:TextStyle(color: Colors.white70)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"EcoWear",subsection: "Bags")));
                  },
                ),
                ListTile(
                  title:Text("Foot Wear",style:TextStyle(color: Colors.white70)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildProducts(categoryName:"EcoWear",subsection: "Foot Wear")));
                  },
                ),
                ListTile(
                  title:Text("Scarves",style:TextStyle(color: Colors.white70)),
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