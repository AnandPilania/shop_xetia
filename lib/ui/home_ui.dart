import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/controllers.dart';
import 'package:xetia_shop/ui/ui.dart';

import 'components/components.dart';

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
      body: Column(
        children: [
          Obx(() => bodyObject[bottomBarController.currentBottomBar.value]),
        ],
      ),
      bottomNavigationBar: XetiaBottomBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder(
          init: ThemeController(),
          builder: (ThemeController controller) => FloatingActionButton(
            onPressed: () {
              controller.changeTheme(!controller.isDark.value);
              Get.changeTheme(controller.theme);
            },
            child: Center(
              child: Icon(controller.isDark.value
                  ? Icons.brightness_1
                  : Icons.brightness_2),
            ),
          ),
        ),
      ),
    );
  }
}
