import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/_controllers.dart';
import '../ui/_ui.dart';
import '../ui/components/_components.dart';

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
