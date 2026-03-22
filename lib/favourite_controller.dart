import 'dart:convert';
import 'package:get/get.dart';
import 'package:loop_wear/storage_utility.dart';
import 'loaders.dart';
import 'package:flutter/material.dart';

class FavouriteController extends GetxController {
  //static FavouriteController get instance=> Get.find();

  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  void initFavourites() {
    final json = TLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
        storedFavourites.map((key, value) => MapEntry(key, value as bool)),
      );
    }
  }

  bool isFavourite(String id) {
    return favourites[id] ?? false;
  }

  void toggleFavouriteProduct(BuildContext context, String id) {
    if (favourites.containsKey(id)) {
      //TLocalStorage.instance().removeData(id);
      favourites.remove(id);
      saveFavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(
        context: context,
        message: 'Your wishlist item has been removed',
      );
    } else {
      favourites[id] = true;
      saveFavouritesToStorage();
      TLoaders.customToast(
        context: context,
        message: 'Product has been added to the wishlist',
      );
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favourites', encodedFavourites);
  }
}
