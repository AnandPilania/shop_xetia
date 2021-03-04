import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/controllers/focus_node_controller.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:xetia_shop/utils/_utils.dart';

class RegisterUI extends StatelessWidget {
  final LandingPageController loginController =
      Get.find<LandingPageController>();
  final FocusNodeController focusController = Get.find<FocusNodeController>();
  final TextFieldController _textFieldController = Get.find();
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
                    SizedBox(height: (heightApp + paddingTop) * 0.075),
                    XetiaTextField(
                      textInputType: TextInputType.name,
                      controller: _textFieldController.firstName,
                      validator: Validator().name,
                      hintText: kFirstName.tr,
                      focusNode: focusController.firstName,
                      nextFocus: focusController.lastName,
                    ),
                    SizedBox(height: 5),
                    XetiaTextField(
                      textInputType: TextInputType.name,
                      controller: _textFieldController.lastName,
                      validator: Validator().name,
                      hintText: kLastName.tr,
                      focusNode: focusController.lastName,
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => AnimatedSwitcher(
                          duration: Duration(milliseconds: 250),
                          child: focusController.topContainer.value == true
                              ? SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    loginController.loginMethod =
                                        LoginMethods.ResendTokenEmail;
                                  },
                                  child: Text(kResendActivationKey.tr,
                                      style:
                                          context.textTheme.headline4.copyWith(
                                        color: const Color(0xff3a7af2),
                                      ),
                                      textAlign: TextAlign.center)))),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: MyButton(
                        iconSuffix: Icons.arrow_right,
                        color: context.theme.primaryColor,
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            FocusScope.of(context).unfocus();
                            loginController.loginMethod =
                                LoginMethods.Register2;
                          }
                        },
                        text: kNext.tr,
                      ),
                    ),
                    SizedBox(height: 10),
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
