import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/focus_node.dart';

import '../../../constants/_constants.dart';
import '../../../controllers/_controllers.dart';
import '../../../ui/landing_page/recovery_ui.dart';
import '../../../utils/validation.dart';
import '../../components/_components.dart';

class EmailLogin extends StatelessWidget {
  final SignInController _signInController = Get.put(SignInController());
  final LandingPageController loginController = Get.find<LandingPageController>();
  final FocusController focusController = Get.find<FocusController>();
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
                SizedBox(height: 10),
                Column(
                  children: [
                    XetiaTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: _signInController.email,
                      validator: Validator().email,
                      hintText: "Email",
                      focusNode: focusController.emailLogin,
                    ),
                    SizedBox(height: 5),
                    Obx(
                      () => XetiaTextField(
                        textInputType: TextInputType.emailAddress,
                        controller: _signInController.pass,
                        focusNode: focusController.passwordLogin,
                        validator: Validator().password,
                        hintText: "Password",
                        isPassword: true,
                        isObscure: _signInController.isObscure,
                        changeObscure: () {
                          _signInController.isObscure = !_signInController.isObscure;
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
                          if (_formKey.currentState.validate()) {
                            _signInController.resSignIn(context: context);
                          }
                        },
                        text: "Sign In",
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                        child: Text("forgot password", style: context.theme.textTheme.headline4),
                        onTap: () {
                          Get.to(RecoveryUI());
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
