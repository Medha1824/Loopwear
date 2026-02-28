import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget{
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
            ExpansionTile(
              title: Text("Men"),
            leading:Icon(Icons.man),
            childrenPadding: EdgeInsets.only(left:60),
            children: [
              ListTile(
                title:Text("Shirts"),
                onTap: (){},
              ),
              ListTile(
                title:Text("Pants"),
                onTap: (){},
              ),
              ListTile(
                title:Text("T Shirts"),
                onTap: (){},
              ),
              ListTile(
                title:Text("Sweat Shirts"),
                onTap: (){},
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
                  onTap: (){},
                ),
                ListTile(
                  title:Text("Pants"),
                  onTap: (){},
                ),
                ListTile(
                  title:Text("Co-ord Set"),
                  onTap: (){},
                ),
                ListTile(
                  title:Text("Cardigan"),
                  onTap: (){},
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
                  onTap: (){},
                ),
                ListTile(
                  title:Text("jeans"),
                  onTap: (){},
                ),
                ListTile(
                  title:Text("play-wears"),
                  onTap: (){},
                ),
                ListTile(
                  title:Text("jackets"),
                  onTap: (){},
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
                  onTap: (){},
                ),
                ListTile(
                  title:Text("Bags and Tote bags"),
                  onTap: (){},
                ),
                ListTile(
                  title:Text("Sandals And Shoes"),
                  onTap: (){},
                ),
                ListTile(
                  title:Text("Scarves"),
                  onTap: (){},
                ),
              ],
            ),
          ],
        ),
      ),),
    );
  }

}