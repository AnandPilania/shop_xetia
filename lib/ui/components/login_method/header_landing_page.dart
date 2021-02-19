import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/ui/components/login_method/_component.dart';

class HeaderLandingPage extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthApp,
      height: (heightApp + paddingTop) * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: context.theme.primaryColorDark,
      ),
      child: Stack(
        children: [
          Center(
            child: XetiaLogoWidget(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabNameLandingPage(),
              TabIndicatorLandingPage(),
            ],
          ),
          Positioned(
            top: paddingTop + 10,
            left: 10,
            child: Obx(
                () => loginController.loginMethod.value == LoginMethods.Unchosen
                    ? SizedBox()
                    : IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: context.theme.primaryColorLight,
                        ),
                        onPressed: () =>
                            loginController.loginMethod(LoginMethods.Unchosen),
                      )),
          ),
        ],
      ),
    );
  }
}
