import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/controllers/focus_node_controller.dart';
import 'package:xetia_shop/controllers/time_token_controller.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/utils/_utils.dart';

class RegisterUI2 extends StatelessWidget {
  final SignUpController _signUpController = Get.find();
  final LandingPageController loginController = Get.find();
  final FocusNodeController focusController = Get.find();
  final TokenTimeController tokenTimeController =
      Get.put(TokenTimeController());
  final TextFieldController _textFieldController = Get.find();
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
                Column(
                  children: [
                    SizedBox(height: 10),
                    XetiaTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: _textFieldController.emailSignUp,
                      validator: Validator().email,
                      hintText: kEmail.tr,
                      focusNode: focusController.emailSignUp,
                      nextFocus: focusController.passwordSignUp,
                    ),
                    SizedBox(height: 5),
                    Obx(
                      () => XetiaTextField(
                        textInputType: TextInputType.emailAddress,
                        controller: _textFieldController.passSignUp,
                        validator: Validator().password,
                        hintText: kPassword.tr,
                        isPassword: true,
                        focusNode: focusController.passwordSignUp,
                        isObscure: _signUpController.isObscure,
                        nextFocus: focusController.passwordSignUpValidate,
                        changeObscure: () {
                          _signUpController.isObscure =
                              !_signUpController.isObscure;
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    Obx(
                      () => XetiaTextField(
                        textInputType: TextInputType.emailAddress,
                        controller: _textFieldController.validatePass,
                        validator: ((value) {
                          if (value !=
                              _textFieldController.passSignUp.value.text) {
                            return kErrorValidatePass.tr;
                          } else {
                            return null;
                          }
                        }),
                        hintText: kPassword.tr,
                        isPassword: true,
                        focusNode: focusController.passwordSignUpValidate,
                        isObscure: _signUpController.isValidateObscure,
                        changeObscure: () {
                          _signUpController.isValidateObscure =
                              !_signUpController.isValidateObscure;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Column(
                  children: [
                    Row(
                      children: [
                        Obx(() => Checkbox(
                              onChanged: (value) {
                                _toggleController.subscribeEmail = value;
                              },
                              value: _toggleController.subscribeEmail,
                              activeColor: context.theme.primaryColor,
                            )),
                        SizedBox(height: 5),
                        Expanded(
                          child: AutoSizeText(
                            kSubscribeText.tr,
                            maxLines: 2,
                            style: context.textTheme.headline4,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: MyButton(
                        iconSuffix: Icons.arrow_right,
                        color: context.theme.primaryColor,
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            FocusScope.of(context).unfocus();
                            loginController.loginMethod =
                                LoginMethods.Register3;
                            tokenTimeController.startController();
                            //_signUpController.resSignUp(context: context);
                          }
                        },
                        text: kRegister.tr,
                      ),
                    ),
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
