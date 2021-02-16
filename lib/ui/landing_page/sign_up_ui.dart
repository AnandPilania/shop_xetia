import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/utils/_utils.dart';

import '../components/_components.dart';

class SignUpUI extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text("Sign Up", style: context.theme.textTheme.headline1),
                    ],
                  ),
                  SizedBox(height: 60),
                  Column(
                    children: [
                      TextFieldName(
                        textInputType: TextInputType.name,
                        controller: _signUpController.firstName,
                        validator: Validator().name,
                        hintText: "First Name",
                        iconData: Icons.person,
                        isPassword: false,
                      ),
                      SizedBox(height: 30),
                      TextFieldName(
                        textInputType: TextInputType.name,
                        controller: _signUpController.lastName,
                        validator: Validator().name,
                        hintText: "Last Name",
                        iconData: Icons.person,
                        isPassword: false,
                      ),
                      SizedBox(height: 30),
                      TextFieldName(
                        textInputType: TextInputType.emailAddress,
                        controller: _signUpController.email,
                        validator: Validator().email,
                        hintText: "Email",
                        iconData: Icons.email,
                        isPassword: false,
                      ),
                      SizedBox(height: 30),
                      TextFieldName(
                        textInputType: TextInputType.emailAddress,
                        controller: _signUpController.pass,
                        validator: Validator().password,
                        hintText: "Password",
                        iconData: Icons.lock_outline,
                        isPassword: true,
                      ),
                      SizedBox(height: 10),
                      CheckboxListTile(
                        title: Text(
                          'Animate Slowly',
                          style: context.theme.textTheme.headline5,
                        ),
                        value: true,
                        onChanged: (bool value) {},
                        activeColor: context.theme.primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  MyButton(
                    color: context.theme.primaryColor,
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        _signUpController.resSignUp(context: context);
                      }
                    },
                    text: "Sign Up",
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "or sign in with",
                              textAlign: TextAlign.center,
                              style: context.theme.textTheme.headline4,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (String signOtherAsset in signInOtherAssets)
                            CircleAvatar(
                              radius: 30,
                              child: SvgPicture.asset(
                                signOtherAsset,
                                height: 30,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 20),
                      MyButton(
                        color: context.theme.primaryColor,
                        onTap: () {
                          Get.back();
                        },
                        text: "Back to Sign In",
                      ),
                      SizedBox(height: 60),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FABTheme(),
    );
  }
}
