import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/_constants.dart';
import '../../controllers/_controllers.dart';

class XetiaTabBar extends StatelessWidget {
  final HeaderHomeController controllerPage = Get.find();

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
                      onTap: () => controllerPage.changeHeader(
                          position: object[2], isSwiped: false),
                      child: Container(
                          width: widthApp * 0.3,
                          height: heightApp * 0.06,
                          child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 250),
                              child: controllerPage.currentPage != object[2]
                                  ? Icon(object[1],
                                      color: context.theme.primaryColorLight)
                                  : Text(object[0].toString().tr,
                                      style: context.textTheme.headline2,
                                      textAlign: TextAlign.center))),
                    ),
                ],
              )),
          Expanded(
            child: Stack(
              children: [
                Obx(() => AnimatedPositioned(
                      left: (widthApp * 0.05) +
                          ((widthApp * 0.325) * controllerPage.currentPage),
                      duration: Duration(milliseconds: 250),
                      child: Container(
                          height: 3,
                          width: widthApp * 0.25,
                          color: context.theme.primaryColor),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
