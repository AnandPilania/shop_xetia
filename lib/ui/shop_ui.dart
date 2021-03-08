import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/_ui.dart';

import '../constants/_constants.dart';
import '../controllers/_controllers.dart';
import '../ui/components/_components.dart';

class ShopUI extends StatelessWidget {
  final HeaderHomeController headerController = Get.find();
  final ToggleController _toggleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: paddingTop,
            width: widthApp,
            color: context.theme.primaryColorDark),
        XetiaTabBar(),
        Expanded(
          child: PageView(
            controller: headerController.pageController,
            onPageChanged: (value) =>
                headerController.changeHeader(position: value),
            scrollDirection: Axis.horizontal,
            children: [
              Obx(() => AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: _toggleController.isShopOwner)),
              ProfileScreen(),
              MessageScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
