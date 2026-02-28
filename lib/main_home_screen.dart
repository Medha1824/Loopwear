import 'package:flutter/material.dart';
import 'package:loop_wear/search_screen.dart';


class MainHomeScreen extends StatefulWidget{
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}
class _MainHomeScreenState extends State<MainHomeScreen> {

  Widget buildCard()=> Container(
    height: 250,
    width: 400,
    color: Colors.white,
    child:ClipRRect(borderRadius:
    BorderRadius.circular(30),
      child:Material(child:Ink.image(image: NetworkImage(
      'https://contentsnare.com/wp-content/uploads/2021/12/1964-dummy-text-image-generators-1024x576.jpg'),
     fit: BoxFit.cover,
        child:InkWell(
          onTap: (){

          },
        )
    ),)),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Color(0xFFCCB7AE),
        leading: Icon(Icons.menu, color: Colors.white,size: 26,),
        title:Text("LoopWear",style:TextStyle(color:Colors.white,fontSize:34,fontFamily: 'Anydore')),
        centerTitle: true,
        actions: [IconButton(
                    icon:Icon(
            Icons.search, size: 27,color: Colors.white,),
          onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
        },
        )],
      ),
      body: Container(

        height: 250,
        child:ListView(
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
        )
      )
    );

  }
}