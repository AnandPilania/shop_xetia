import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/controllers/focus_node_controller.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/ui/components/login_method/_component.dart';

class HeaderLandingPage extends StatelessWidget {
  final LandingPageController loginController = Get.find<LandingPageController>();
  final FocusNodeController focusController = Get.find<FocusNodeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: Duration(milliseconds: 700),
          curve: Curves.easeOut,
          width: widthApp,
          height: focusController.topContainer == true ? (heightApp) * 0.2 : (heightApp) * 0.455,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
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
                child:
                    Obx(() => loginController.loginMethod == LoginMethods.Unchosen || loginController.loginMethod == LoginMethods.Register
                        ? SizedBox()
                        : IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: context.theme.primaryColorLight,
                            ),
                            onPressed: () {
                              loginController.isLogin = true;
                              FocusScope.of(context).unfocus();
                              if (loginController.loginMethod == LoginMethods.Register2) {
                                loginController.loginMethod = LoginMethods.Register;
                              } else {
                                loginController.loginMethod = LoginMethods.Unchosen;
                              }
                            },
                          )),
              ),
            ],
          ),
        ));
  }
}
