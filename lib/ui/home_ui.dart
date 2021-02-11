import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/controllers.dart';
import 'package:xetia_shop/ui/components/components.dart';
import 'package:xetia_shop/ui/ui.dart';

class HomeUI extends StatelessWidget {
  static List<Widget> bodyObject = [
    ShopUI(),
    FavoriteUI(),
    CartUI(),
    SettingUI(),
  ];

  final bottomBarController = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => bodyObject[bottomBarController.currentBottomBar.value]),
      bottomNavigationBar: XetiaBottomBar(),
      floatingActionButton: FABTheme(),
    );
  }
}
