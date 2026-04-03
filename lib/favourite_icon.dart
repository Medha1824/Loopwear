import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loop_wear/favourite_controller.dart';
import 'package:get/get.dart';

class FavouriteIcon extends StatelessWidget{
  const FavouriteIcon({super.key, required this.id});
final String id;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavouriteController>();
    return Obx(
      () => IconButton(
        onPressed: () {
        return controller.toggleFavouriteProduct(context,
            id);
      },
        icon: controller.isFavourite(id) ? Icon(CupertinoIcons.heart_fill,color:Colors.red,):
        Icon(CupertinoIcons.heart,color:Color(0xFF9F7F88),),
      ),
    );
  }
}
