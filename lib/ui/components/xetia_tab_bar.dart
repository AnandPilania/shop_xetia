import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/dimens.dart';
import 'package:xetia_shop/controllers/controllers.dart';

class XetiaTabBar extends StatelessWidget {
  static List<List<dynamic>> headingObject = [
    ["Shop", Icons.shopping_cart],
    ["Account", Icons.person],
    ["Message", Icons.message]
  ];
  final controllerPage = Get.put(HeaderHomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightApp * 0.075,
      color: context.theme.primaryColorDark,
      child: Column(
        children: [
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var object in headingObject)
                    GestureDetector(
                      onTap: () => controllerPage.changeHeader(object[0], headingObject.indexOf(object)),
                      child: Container(
                          width: widthApp * 0.3,
                          height: heightApp * 0.06,
                          child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 450),
                              child: controllerPage.currentHeader.value != object[0]
                                  ? Icon(object[1], size: 24)
                                  : Text(object[0], style: context.textTheme.headline2))),
                    ),
                ],
              )),
          Expanded(
            child: Stack(
              children: [
                Obx(() => AnimatedPositioned(
                      left: (widthApp * 0.05) + ((widthApp * 0.325) * controllerPage.currentBarHeader.value),
                      duration: Duration(milliseconds: 450),
                      child: Container(height: 3, width: widthApp * 0.25, color: context.theme.primaryColor),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
