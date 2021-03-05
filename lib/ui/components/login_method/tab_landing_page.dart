import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/controllers/time_token_controller.dart';
import 'package:xetia_shop/language/_components.dart';

class TabNameLandingPage extends StatelessWidget {
  final TokenTimeController tokenTimeController =
      Get.put(TokenTimeController());
  final LandingPageController loginController = Get.find();
  final ToggleController _toggleController = Get.find();

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
                  _toggleController.isLogin = true;
                  loginController.loginMethod = LoginMethods.Unchosen;
                  FocusScope.of(context).unfocus();
                },
                child: Text(kLogin.tr,
                    style: context.textTheme.headline3,
                    textAlign: TextAlign.center))),
        Expanded(
            flex: 3,
            child: GestureDetector(
                onTap: () {
                  _toggleController.isLogin = false;
                  if (_toggleController.isTicking) {
                    loginController.loginMethod = LoginMethods.Register3;
                  } else {
                    loginController.loginMethod = LoginMethods.Register;
                  }

                  FocusScope.of(context).unfocus();
                },
                child: Text(kRegister.tr,
                    style: context.textTheme.headline3,
                    textAlign: TextAlign.center))),
        Spacer()
      ],
    );
  }
}

class TabIndicatorLandingPage extends StatelessWidget {
  final LandingPageController loginController = Get.find();
  final ToggleController _toggleController = Get.find();

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
                  alignment: _toggleController.isLogin
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
