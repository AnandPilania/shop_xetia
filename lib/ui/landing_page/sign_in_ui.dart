import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/_ui.dart';
import 'package:xetia_shop/ui/components/login_method/_component.dart';

import '../../constants/_constants.dart';
import '../../controllers/_controllers.dart';

class SignInUI extends StatelessWidget {
  final LandingPageController loginController = Get.find<LandingPageController>();

  final List<Widget> loginMethodWidget = [
    EmailLogin(),
    FacebookLogin(),
    AppleLogin(),
    GmailLogin(),
    DisplayMethod(),
    RegisterUI(),
  ];

  Widget getMethodWidget() {
    return loginMethodWidget[loginController.loginMethod.index];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: widthApp,
              height: heightApp + paddingTop,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: paddingTop, width: widthApp, color: context.theme.backgroundColor),
                  HeaderLandingPage(),
                  Obx(() => Expanded(
                        child: AnimatedSwitcher(duration: Duration(milliseconds: 350), child: getMethodWidget()),
                      )),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            height: 120,
            width: widthApp,
            child: BottomWaveLandingPage(),
          ),
        ),
      ],
    );
  }
}
