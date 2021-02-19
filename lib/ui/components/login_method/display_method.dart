import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/enums.dart';
import 'package:xetia_shop/controllers/landing_page_controller.dart';

class DisplayMethod extends StatelessWidget {
  final LandingPageController loginController =
      Get.find<LandingPageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => loginController.setMethod(
                methods: LoginMethods.Email,
                textColor: context.theme.primaryColorLight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  SvgPicture.asset(
                    "assets/svg/email.svg",
                    color: context.theme.primaryColorLight,
                  ),
                  Text("E-mail", style: context.textTheme.headline3)
                ]),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () => loginController.setMethod(
                methods: LoginMethods.Facebook,
                textColor: context.theme.primaryColorLight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  SvgPicture.asset(
                    "assets/svg/facebook.svg",
                    color: context.theme.primaryColorLight,
                  ),
                  Text("Facebook", style: context.textTheme.headline3)
                ]),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => loginController.setMethod(
                methods: LoginMethods.AppleID,
                textColor: context.theme.primaryColorLight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  SvgPicture.asset(
                    "assets/svg/apple.svg",
                    color: context.theme.primaryColorLight,
                  ),
                  Text("Apple ID", style: context.textTheme.headline3)
                ]),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () => loginController.setMethod(
                methods: LoginMethods.Gmail,
                textColor: context.theme.primaryColorLight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  SvgPicture.asset(
                    "assets/svg/gmail.svg",
                    color: context.theme.primaryColorLight,
                  ),
                  Text("Gmail", style: context.textTheme.headline3)
                ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
