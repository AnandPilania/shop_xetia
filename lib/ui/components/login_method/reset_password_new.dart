import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/_constants.dart';
import '../../../controllers/_controllers.dart';
import '../../../language/language_key.dart';
import '../../../ui/components/_components.dart';
import '../../../utils/validation.dart';

class ResetPassword extends StatelessWidget {
  final FocusNodeController focusNodeController = Get.find<FocusNodeController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextFieldController _textFieldController = Get.find();
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
                    "Enter your email to reset your password",
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
                    controller: _textFieldController.resendEmail,
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
                    //FocusScope.of(context).unfocus();
                    //loginController.loginMethod = LoginMethods.Register3;
                    //tokenTimeController.startController();
                  }
                },
                text: "Reset my password",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
