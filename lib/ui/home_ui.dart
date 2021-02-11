import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/_ui.dart';
import 'package:xetia_shop/ui/components/_components.dart';

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
      body: Stack(
        children: [
          Obx(() => bodyObject[bottomBarController.currentBottomBar.value]),
          Positioned(bottom: 0, child: XetiaBottomBar()),
        ],
      ),
      floatingActionButton: FABTheme(),
    );
  }
}
