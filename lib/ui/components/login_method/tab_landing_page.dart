import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

class TabNameLandingPage extends StatelessWidget {
  final LandingPageController loginController =
      Get.find<LandingPageController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Expanded(
            flex: 3,
            child: GestureDetector(
                onTap: () {
                  loginController.toggle();
                  loginController.setMethod(
                    methods: LoginMethods.Unchosen,
                    textColor: context.theme.primaryColorLight,
                  );
                },
                child: Text("Login",
                    style: context.textTheme.headline3,
                    textAlign: TextAlign.center))),
        Expanded(
            flex: 3,
            child: GestureDetector(
                onTap: () {
                  loginController.toggle();
                  loginController.setMethod(
                    methods: LoginMethods.Register,
                    textColor: context.theme.primaryColorLight,
                  );
                },
                child: Text("Register",
                    style: context.textTheme.headline3,
                    textAlign: TextAlign.center))),
        Spacer()
      ],
    );
  }
}

class TabIndicatorLandingPage extends StatelessWidget {
  final LandingPageController loginController =
      Get.find<LandingPageController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Expanded(
            flex: 6,
            child: Obx(() => AnimatedAlign(
                  duration: Duration(milliseconds: 250),
                  alignment: loginController.isLogin.value == true
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    width: widthApp * 3 / 8,
                    height: 10.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color(0xfffcb216),
                    ),
                  ),
                ))),
        Spacer()
      ],
    );
  }
}
