import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/assets.dart';

class DashboardController extends GetxController {
  var searchBarController = TextEditingController().obs;
  var isFavoriteClicked = false.obs;
  var indexSelectedMenu = 0.obs;
  var indexSelectedCategory = 0.obs;
  var indexSelectedItems = 0.obs;

  List<String> upperMenu = ['Plant', 'Fertilizer', 'Seed', 'Tool', 'Pestisida'];
  List<String> middleMenu = ['All', 'Popular', 'New Arival', 'Best Seller'];
  List<String> menuImages = [
    (Assets.imgMenuPlant),
    (Assets.imgMenuFertilizer),
    (Assets.imgMenuSeed),
    (Assets.imgMenuTool),
    (Assets.imgMenuPesticide),
  ];
  List<Color> upperMenuColor = [
    const Color(0xFFDAFFD8),
    const Color(0xFFFBF0E5),
    const Color(0xFFE6F2F8),
    const Color(0xFFFAEEFF),
    const Color(0xFFF8EFEE)
  ];

  List<Color> iconMenuColor = [
    const Color(0xFFa3d7b3),
    const Color(0xFFf1c8aa),
    const Color(0xFFb0c2e5),
    const Color(0xFFbd8cd4),
    const Color(0xFFec989f)
  ];

  @override
  void onInit() {
    searchBarController.value.text = "Search here...";
    super.onInit();
  }
}
