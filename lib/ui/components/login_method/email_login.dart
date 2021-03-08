import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/focus_node_controller.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/utils/_utils.dart';

import '../../../constants/_constants.dart';
import '../../../controllers/_controllers.dart';
import '../../../ui/landing_page/recovery_ui.dart';
import '../../../utils/validation.dart';
import '../../components/_components.dart';

class EmailLogin extends StatelessWidget {
  final TextFieldController _textFieldController = Get.find();
  final SignInController _signInController = Get.put(SignInController());
  final LandingPageController loginController = Get.find();
  final FocusNodeController focusController = Get.find();
  final ToggleController _toggleController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (heightApp + paddingTop) * 0.4,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: (heightApp + paddingTop) * 0.075),
                Column(
                  children: [
                    XetiaTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: _textFieldController.email,
                      validator: Validator().email,
                      hintText: kEmail.tr,
                      focusNode: focusController.emailLogin,
                      nextFocus: focusController.passwordLogin,
                    ),
                    SizedBox(height: 5),
                    Obx(
                      () => XetiaTextField(
                        textInputType: TextInputType.emailAddress,
                        controller: _textFieldController.pass,
                        focusNode: focusController.passwordLogin,
                        validator: Validator().password,
                        hintText: kPassword.tr,
                        isPassword: true,
                        isObscure: _toggleController.isObscureSignIn,
                        changeObscure: () {
                          print("change");
                          return _toggleController.isObscureSignIn =
                              _toggleController.isObscureSignIn.toggle();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: MyButton(
                        color: context.theme.primaryColor,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState.validate()) {
                            // _signInController.resSignIn(context: context);
                            _signInController.reSignInV2(context: context);
                          }
                        },
                        text: kSignIn.tr,
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                        child: Text(kForgotPassword.tr, style: context.theme.textTheme.headline4),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          loginController.loginMethod = LoginMethods.ResetPassword;
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
