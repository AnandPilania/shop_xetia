import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/controllers/focus_node.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/ui/components/login_method/_component.dart';

class HeaderLandingPage extends StatelessWidget {
  final LandingPageController loginController =
      Get.find<LandingPageController>();
  final FocusController focusController = Get.find<FocusController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: Duration(milliseconds: 700),
          curve: Curves.easeOut,
          width: widthApp,
          height: focusController.topContainer == true
              ? (heightApp) * 0.2
              : (heightApp) * 0.425,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
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
                child: Obx(() => loginController.loginMethod ==
                            LoginMethods.Unchosen ||
                        loginController.loginMethod == LoginMethods.Register
                    ? SizedBox()
                    : IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: context.theme.primaryColorLight,
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          loginController.loginMethod = LoginMethods.Unchosen;
                        },
                      )),
              ),
            ],
          ),
        ));
  }
}
