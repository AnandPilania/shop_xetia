import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/constants/language_key.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/landing_page/on_boarding.dart';

class BottomWaveLandingPage extends StatelessWidget {
  final ThemeController controller = Get.put(ThemeController());
  final LocalizationController languageController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        WaveWidget(
          config: Get.isDarkMode == true
              ? CustomConfig(
                  gradients: [
                    [context.theme.primaryColor, kLightOrangeXetia],
                    [Colors.black, Colors.black],
                    [context.theme.primaryColor, kLightOrangeXetia],
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
                    [context.theme.primaryColor, kLightOrangeXetia],
                    [Colors.black, Colors.black],
                    [context.theme.primaryColor, kLightOrangeXetia]
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
              SizedBox(
                width: widthApp * 0.13,
                child: Obx(() => Material(
                      child: DropdownButtonHideUnderline(
                        child: Container(
                          color: Colors.transparent,
                          child: DropdownButton(
                              isExpanded: false,
                              iconSize: 0,
                              dropdownColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              value: languageController.language,
                              items: [
                                DropdownMenuItem(
                                  child: SvgPicture.asset("assets/svg/america.svg"),
                                  value: langs.first,
                                ),
                                DropdownMenuItem(
                                  child: SvgPicture.asset("assets/svg/indonesia.svg"),
                                  value: langs[1],
                                ),
                                DropdownMenuItem(
                                  child: SvgPicture.asset("assets/svg/japan.svg"),
                                  value: langs[2],
                                ),
                              ],
                              onChanged: (value) {
                                languageController.changeLanguage(value);
                              }),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                width: widthApp * 0.13,
                child: GestureDetector(
                  onTap: () {
                    controller.changeTheme(!controller.isDark.value);
                    Get.changeTheme(controller.theme);
                  },
                  child: SvgPicture.asset("assets/svg/moon.svg", color: context.theme.primaryColorLight),
                ),
              ),
              SizedBox(
                width: widthApp * 0.13,
                child: GestureDetector(
                    onTap: () => Get.off(OnBoardingPage()),
                    child: SvgPicture.asset("assets/svg/onboarding.svg", color: context.theme.primaryColorLight)),
              ),
              SizedBox(width: 1),
            ],
          ),
        )
      ],
    );
  }
}
