import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/_ui.dart';

import '../constants/_constants.dart';
import '../controllers/_controllers.dart';
import '../ui/components/_components.dart';

class ShopUI extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final HeaderHomeController headerController = Get.put(HeaderHomeController());

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
            onPageChanged: (value) => headerController.changeHeader(value),
            scrollDirection: Axis.horizontal,
            children: [
              ShopScreen(),
              ProfileScreen(),
              MessageScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
