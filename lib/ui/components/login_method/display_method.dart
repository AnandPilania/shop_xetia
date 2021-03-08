import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/time_token_controller.dart';

import '../../../constants/_constants.dart';
import '../../../controllers/landing_page_controller.dart';
import '../../../language/language_key.dart';

class DisplayMethod extends StatelessWidget {
  final LandingPageController loginController = Get.find();
  final TokenTimeController tokenTimeController = Get.put(TokenTimeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (heightApp + paddingTop) * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: widthApp * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print(tokenTimeController.isTickingPassChange);
                      if (tokenTimeController.isTickingPassChange) {
                        loginController.loginMethod = LoginMethods.ChangePassword;
                      } else {
                        loginController.loginMethod = LoginMethods.Email;
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/email.svg",
                            color: context.theme.primaryColorLight,
                          ),
                          AutoSizeText(kEmail.tr, style: context.textTheme.headline3, maxLines: 1, textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () => loginController.loginMethod = LoginMethods.Facebook,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: [
                        SvgPicture.asset(
                          "assets/svg/facebook.svg",
                          color: context.theme.primaryColorLight,
                        ),
                        AutoSizeText(kFacebook.tr, style: context.textTheme.headline3, maxLines: 1, textAlign: TextAlign.center)
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: widthApp * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => loginController.loginMethod = LoginMethods.AppleID,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: [
                        SvgPicture.asset(
                          "assets/svg/apple.svg",
                          color: context.theme.primaryColorLight,
                        ),
                        AutoSizeText(kAppleId.tr, style: context.textTheme.headline3, maxLines: 1, textAlign: TextAlign.center)
                      ]),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () => loginController.loginMethod = LoginMethods.Gmail,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: [
                        SvgPicture.asset(
                          "assets/svg/gmail.svg",
                          color: context.theme.primaryColorLight,
                        ),
                        AutoSizeText(kGmail.tr, style: context.textTheme.headline3, maxLines: 1, textAlign: TextAlign.center)
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
