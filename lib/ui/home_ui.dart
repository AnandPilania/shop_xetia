import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/components/xetia_bottom_bar.dart';
import 'package:xetia_shop/utils/theme.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/ui/_ui.dart';

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
      floatingActionButton: FABTheme(),
    );
  }
}
