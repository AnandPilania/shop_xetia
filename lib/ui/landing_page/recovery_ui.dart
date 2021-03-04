import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/utils/_utils.dart';

import '../components/_components.dart';

class RecoveryUI extends StatelessWidget {
  final TextFieldController _textFieldController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: context.theme.primaryColorDark,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: heightApp,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kRecoveryHeading.tr,
                            style: context.theme.textTheme.headline1),
                        SizedBox(height: 10),
                        Text(kRecoverySub.tr,
                            style: context.theme.textTheme.headline3),
                      ],
                    ),
                    SizedBox(height: 60),
                    XetiaTextField(
                      textInputType: TextInputType.emailAddress,
                      controller: _textFieldController.recovery,
                      validator: Validator().email,
                      hintText: kEmail.tr,
                      isPassword: false,
                    ),
                    SizedBox(height: 30),
                    MyButton(
                      color: context.theme.primaryColor,
                      onTap: () {
                        if (_formKey.currentState.validate()) {}
                      },
                      text: kResetPassword.tr,
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: GestureDetector(
                          child: Text(
                            kBackSignIn.tr,
                            style: context.theme.textTheme.headline5,
                          ),
                          onTap: () {
                            Get.back();
                          }),
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FABTheme(),
      ),
    );
  }
}
