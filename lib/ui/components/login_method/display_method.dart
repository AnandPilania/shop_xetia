import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/enums.dart';
import 'package:xetia_shop/controllers/login_controller.dart';

class DisplayMethod extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => loginController.setMethod(LoginMethods.Email),
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
              onTap: () => loginController.setMethod(LoginMethods.Facebook),
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
              onTap: () => loginController.setMethod(LoginMethods.AppleID),
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
              onTap: () => loginController.setMethod(LoginMethods.Gmail),
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
