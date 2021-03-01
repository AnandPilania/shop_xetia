import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/components/fab_language.dart';

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
    //Get.lazyPut(() => HeaderHomeController());
    return Stack(
      children: [
        Scaffold(
          body: Obx(() => bodyObject[bottomBarController.currentBottomBar]),
          floatingActionButton: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FABLanguage(),
                FABTheme(),
              ],
            ),
          ),
        ),
        Positioned(bottom: 0, child: XetiaBottomBar()),
      ],
    );
  }
}
