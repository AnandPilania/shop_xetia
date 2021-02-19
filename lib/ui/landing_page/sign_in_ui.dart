import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:xetia_shop/ui/components/fab_theme.dart';

import '../../constants/_constants.dart';
import '../../ui/components/login_method/_component.dart';
import '../../controllers/login_controller.dart';

class SignInUI extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();

  final List<Widget> loginMethod = [
    EmailLogin(),
    FacebookLogin(),
    AppleLogin(),
    GmailLogin(),
    DisplayMethod(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: FABTheme(),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: widthApp,
              height: heightApp + paddingTop,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: widthApp,
                    height: (heightApp + paddingTop) * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      color: context.theme.primaryColorDark,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: widthApp * 0.4,
                            height: widthApp * 0.4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff616569),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/svg/xetialogo.svg"),
                                SizedBox(height: 10),
                                SvgPicture.asset("assets/svg/xetiafont.svg"),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Expanded(
                                    flex: 3,
                                    child: GestureDetector(
                                        onTap: () => loginController.toggle(),
                                        child: Text("Login", style: context.textTheme.headline3, textAlign: TextAlign.center))),
                                Expanded(
                                    flex: 3,
                                    child: GestureDetector(
                                        onTap: () => loginController.toggle(),
                                        child: Text("Register", style: context.textTheme.headline3, textAlign: TextAlign.center))),
                                Spacer()
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Expanded(
                                    flex: 6,
                                    child: Obx(() => AnimatedAlign(
                                          duration: Duration(milliseconds: 250),
                                          alignment: loginController.isLogin.value == true ? Alignment.centerLeft : Alignment.centerRight,
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
                            ),
                          ],
                        ),
                        Positioned(
                          top: paddingTop + 10,
                          left: 10,
                          child: Obx(() => loginController.loginMethod.value == LoginMethods.Unchosen
                              ? SizedBox()
                              : IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: kWhite,
                                  ),
                                  onPressed: () => loginController.loginMethod(LoginMethods.Unchosen),
                                )),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => Expanded(
                        child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 350), child: loginMethod[loginController.loginMethod.value.index]),
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
            child: Stack(
              alignment: Alignment.center,
              children: [
                WaveWidget(
                  config: Get.isDarkMode == true
                      ? CustomConfig(
                          gradients: [
                            [context.theme.primaryColor, context.theme.primaryColor],
                            [Colors.black, Colors.black],
                            [context.theme.primaryColor, context.theme.primaryColor],
                            [Colors.black, Colors.black]
                          ],
                          durations: [35000, 19440, 10800, 6000],
                          heightPercentages: [0.20, 0.23, 0.25, 0.30],
                          blur: MaskFilter.blur(BlurStyle.solid, 2),
                          gradientBegin: Alignment.bottomLeft,
                          gradientEnd: Alignment.topRight,
                        )
                      : CustomConfig(
                          gradients: [
                            [Colors.black, Colors.black],
                            [context.theme.primaryColor, context.theme.primaryColor],
                            [Colors.black, Colors.black],
                            [context.theme.primaryColor, context.theme.primaryColor]
                          ],
                          durations: [35000, 19440, 10800, 6000],
                          heightPercentages: [0.20, 0.23, 0.25, 0.30],
                          blur: MaskFilter.blur(BlurStyle.solid, 2),
                          gradientBegin: Alignment.bottomLeft,
                          gradientEnd: Alignment.topRight,
                        ),
                  waveAmplitude: 0,
                  waveFrequency: 1.4,
                  wavePhase: 4,
                  size: Size(
                    widthApp,
                    120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 1),
                      SvgPicture.asset("assets/svg/america.svg"),
                      SvgPicture.asset("assets/svg/moon.svg", color: context.theme.primaryColorLight),
                      SvgPicture.asset("assets/svg/onboarding.svg", color: context.theme.primaryColorLight),
                      SizedBox(width: 1),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
