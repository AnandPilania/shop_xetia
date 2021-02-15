import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/utils/_utils.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class SignUpPasswordUI extends StatelessWidget {
  final SignInController _SignInController = Get.put(SignInController());
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.language,
                              size: 28,
                              color: context.theme.accentColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text("Hello", style: context.theme.textTheme.headline1),
                    ],
                  ),
                  SizedBox(height: 60),
                  Column(
                    children: [
                      SizedBox(height: 15),
                      TextFieldName(
                        textInputType: TextInputType.emailAddress,
                        controller: _SignInController.pass,
                        validator: Validator().password,
                        hintText: "Confirm Password",
                        iconData: Icons.lock_outline,
                        isPassword: true,
                      ),
                      SizedBox(height: 15),
                      TextFieldName(
                        textInputType: TextInputType.emailAddress,
                        controller: _SignInController.pass,
                        validator: Validator().password,
                        hintText: "Repeat Your Password",
                        iconData: Icons.lock_outline,
                        isPassword: true,
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                  SizedBox(height: 60),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ButtonIcon(
                          color: context.theme.primaryColor,
                          onTap: () {
                            Get.back(closeOverlays: true);
                          },
                          icon: Icons.arrow_left,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: MyButton(
                          color: context.theme.primaryColor,
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              print("register");
                            }
                          },
                          text: "next",
                        ),
                      ),
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
