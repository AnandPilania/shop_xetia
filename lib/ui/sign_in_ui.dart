import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/utils/_utils.dart';

import 'components/_components.dart';

class SignIn extends StatelessWidget {
  LoginController _loginController = Get.put(LoginController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double paddingTop = Get.context.mediaQueryPadding.top;
    final double widthApp = Get.context.width;
    final double heightApp = Get.context.height - paddingTop;
    return Scaffold(
        backgroundColor: context.theme.primaryColorDark,
        body: SafeArea(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: context.theme.primaryColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 4,
                                      offset: Offset(0, 2))
                                ],
                              ),
                              child: Center(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.language,
                                        size: 28,
                                        color: context.theme.accentColor,
                                      ))),
                            ),
                            SizedBox(height: 40),
                            Text("Welcome",
                                style: context.theme.textTheme.headline3),
                            Text("Sign in to Continue",
                                style: context.theme.textTheme.headline2),
                          ],
                        ),
                        SizedBox(height: 60),
                        Column(
                          children: [
                            TextFieldName(
                              textInputType: TextInputType.emailAddress,
                              controller: _loginController.email,
                              validator: Validator().email,
                              hintText: "Email",
                              iconData: Icons.email,
                              isPassword: false,
                            ),
                            SizedBox(height: 30),
                            TextFieldName(
                              textInputType: TextInputType.emailAddress,
                              controller: _loginController.pass,
                              validator: Validator().password,
                              hintText: "Password",
                              iconData: Icons.lock_outline,
                              isPassword: true,
                            ),
                          ],
                        ),
                        SizedBox(height: 60),
                        Column(
                          children: [
                            MyButton(
                              color: context.theme.primaryColor,
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  _loginController.resLogin();
                                }
                              },
                              text: "sign in",
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                                child: Text("forgot password",
                                    style: context.theme.textTheme.headline5),
                                onTap: () {}),
                          ],
                        ),
                        SizedBox(height: 60),
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
                                CircleAvatar(
                                  radius: 30,
                                  child: SvgPicture.asset(
                                    "assets/svg/google.svg",
                                    height: 30,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  child: SvgPicture.asset(
                                    "assets/svg/twitter.svg",
                                    height: 30,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  child: SvgPicture.asset(
                                    "assets/svg/github.svg",
                                    height: 30,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  child: SvgPicture.asset(
                                    "assets/svg/facebook.svg",
                                    height: 30,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            MyButton(
                              color: context.theme.primaryColor,
                              onTap: () {},
                              text: "Create a Account",
                            ),
                            SizedBox(height: 60),
                          ],
                        ),
                      ],
                    )),
              )),
        )));
  }
}
