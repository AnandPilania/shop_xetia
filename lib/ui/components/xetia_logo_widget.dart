import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/focus_node_controller.dart';

class XetiaLogoWidget extends StatelessWidget {
  final FocusNodeController focusController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: Duration(milliseconds: 700),
          curve: Curves.easeOut,
          width: focusController.topContainer == true
              ? widthApp * 0.15
              : widthApp * 0.4,
          height: focusController.topContainer == true
              ? widthApp * 0.15
              : widthApp * 0.4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.theme.highlightColor,
            boxShadow: [
              BoxShadow(
                  color: context.theme.shadowColor.withOpacity(0.4),
                  blurRadius: 2,
                  offset: Offset(0, 2))
            ],
          ),
          child: AnimatedPadding(
              duration: Duration(milliseconds: 700),
              padding: EdgeInsets.all(
                  focusController.topContainer == true ? 10 : 20),
              child: SvgPicture.asset("assets/svg/xetia.svg",
                  fit: BoxFit.scaleDown, color: kOrangeXetia)),
        ));
  }
}
