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
  final signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    signInController.changeLoginState(false);
    return Stack(
      children: [
        Scaffold(
          body: Obx(() => bodyObject[bottomBarController.currentBottomBar.value]),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0, left: 24.0),
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    signInController.changeLoginState(false);
                    Get.off(SignInUI());
                  },
                  child: Icon(Icons.logout),
                ),
              ),
              FABTheme(),
            ],
          ),
        ),
        Positioned(bottom: 0, child: XetiaBottomBar()),
      ],
    );
  }
}
