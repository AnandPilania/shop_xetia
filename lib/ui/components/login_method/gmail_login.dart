import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

import '../_components.dart';

class GmailLogin extends StatelessWidget {
  final SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MyButton(
          color: context.theme.primaryColor,
          onTap: () {
            _signInController.signInGmail();
            // _signInController.signOutGmail();
          },
          text: "Sign In Gmail",
        ),
      ),
    );
  }
}
