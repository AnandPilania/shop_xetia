import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class XetiaTabBar extends StatelessWidget {
  final HeaderHomeController controllerPage = Get.find<HeaderHomeController>();

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
                  for (var object in kHeadingObject)
                    GestureDetector(
                      onTap: () => controllerPage.changeHeader(kHeadingObject.indexOf(object)),
                      child: Container(
                          width: widthApp * 0.3,
                          height: heightApp * 0.06,
                          child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 250),
                              child: controllerPage.currentPage.value != object[2]
                                  ? Icon(object[1], size: 24)
                                  : Text(object[0],
                                      style: context.textTheme.headline2))),
                    ),
                ],
              )),
          Expanded(
            child: Stack(
              children: [
                Obx(() => AnimatedPositioned(
                      left: (widthApp * 0.05) + ((widthApp * 0.325) * controllerPage.currentPage.value),
                      duration: Duration(milliseconds: 250),
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
