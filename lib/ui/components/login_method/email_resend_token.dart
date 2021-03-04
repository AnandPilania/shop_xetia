import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/focus_node_controller.dart';
import 'package:xetia_shop/controllers/landing_page_controller.dart';
import 'package:xetia_shop/controllers/resend_token_email_controller.dart';
import 'package:xetia_shop/controllers/time_token_controller.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/ui/components/xetia_text_field.dart';
import 'package:xetia_shop/utils/validation.dart';

import '../button_flat.dart';
import 'package:get/get.dart';

class ResendTokenEmail extends StatelessWidget {
  final FocusNodeController focusNodeController = Get.find<FocusNodeController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ResendEmailTokenController controllerEmail = Get.put(ResendEmailTokenController());
  final LandingPageController loginController = Get.find<LandingPageController>();
  final TokenTimeController tokenTimeController = Get.put(TokenTimeController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (heightApp + paddingTop) * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: AutoSizeText(
                    kTokenTimeDown.tr,
                    style: context.textTheme.headline4.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: XetiaTextField(
                    hintText: kEmail.tr,
                    focusNode: focusNodeController.resendTokenEmail,
                    validator: Validator().email,
                    controller: controllerEmail.resendEmail,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MyButton(
                iconSuffix: Icons.arrow_right,
                color: context.theme.primaryColor,
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    FocusScope.of(context).unfocus();
                    loginController.loginMethod = LoginMethods.Register3;
                    tokenTimeController.startController();
                  }
                },
                text: kResendToken.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
