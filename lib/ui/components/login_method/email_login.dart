import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/_constants.dart';
import '../../../controllers/_controllers.dart';
import '../../../ui/landing_page/recovery_ui.dart';
import '../../../utils/validation.dart';
import '../../components/_components.dart';

class EmailLogin extends StatelessWidget {
  final SignInController _signInController = Get.put(SignInController());
  final LoginController loginController = Get.find<LoginController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (heightApp + paddingTop) * 0.4,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Form(
          key: _formKey,
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
                  ),
                  SizedBox(height: 5),
                  Obx(
                    () => XetiaTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: _signInController.pass,
                      validator: Validator().password,
                      hintText: "Password",
                      isPassword: true,
                      isObscure: _signInController.isObscure.value,
                      changeObscure: () {
                        _signInController
                            .changeObscure(!_signInController.isObscure.value);
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
                  SizedBox(height: 5),
                  GestureDetector(
                      child: Text("forgot password",
                          style: context.theme.textTheme.headline5),
                      onTap: () {
                        Get.to(RecoveryUI());
                      }),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            onChanged: (value) {
                              loginController.subscribe(value);
                            },
                            value: loginController.subscribeEmail.value,
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
    );
  }
}
