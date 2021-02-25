import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/controllers/focus_node.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/utils/_utils.dart';

class RegisterUI extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());
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
                      textInputType: TextInputType.name,
                      controller: _signUpController.firstName,
                      validator: Validator().name,
                      hintText: "First Name",
                      focusNode: focusController.firstName,
                      nextFocus: focusController.lastName,
                    ),
                    SizedBox(height: 5),
                    XetiaTextField(
                      textInputType: TextInputType.name,
                      controller: _signUpController.lastName,
                      validator: Validator().name,
                      hintText: "Last Name",
                      focusNode: focusController.lastName,
                      nextFocus: focusController.emailSignUp,
                    ),
                    SizedBox(height: 5),
                    XetiaTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: _signUpController.email,
                      validator: Validator().email,
                      hintText: "Email",
                      focusNode: focusController.emailSignUp,
                      nextFocus: focusController.passwordSignUp,
                    ),
                    SizedBox(height: 5),
                    Obx(
                      () => XetiaTextField(
                        textInputType: TextInputType.emailAddress,
                        controller: _signUpController.pass,
                        validator: Validator().password,
                        hintText: "Password",
                        isPassword: true,
                        focusNode: focusController.passwordSignUp,
                        isObscure: _signUpController.isObscure,
                        changeObscure: () {
                          _signUpController.isObscure = !_signUpController.isObscure;
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
                            _signUpController.resSignUp(context: context);
                          }
                        },
                        text: "Sign Up",
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Obx(() => Checkbox(
                              onChanged: (value) {
                                loginController.subscribeEmail = value;
                              },
                              value: loginController.subscribeEmail,
                              activeColor: context.theme.primaryColor,
                            )),
                        SizedBox(height: 5),
                        Expanded(
                          child: AutoSizeText(
                            "I would like to receive your newsletter and other promotional information.",
                            maxLines: 2,
                            style: context.textTheme.headline4,
                          ),
                        )
                      ],
                    )
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
