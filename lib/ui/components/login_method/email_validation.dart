import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
//import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/controllers/focus_node_controller.dart';
import 'package:xetia_shop/controllers/time_token_controller.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/ui/components/_components.dart';
import 'package:clay_containers/clay_containers.dart';

class RegisterUI3 extends StatelessWidget {
  final SignUpController _signUpController = Get.find<SignUpController>();
  final LandingPageController loginController = Get.find<LandingPageController>();
  final FocusNodeController focusController = Get.find<FocusNodeController>();
  final TokenTimeController tokenTimeController = Get.put(TokenTimeController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (heightApp + paddingTop) * 0.4,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child: Column(
              children: [
                CountdownTimer(
                  controller: tokenTimeController.controller,
                  widgetBuilder: (_, CurrentRemainingTime time) {
                    if (time == null) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                            height: (heightApp + paddingTop) * 0.4,
                            width: widthApp,
                            child: Center(
                                child: Column(
                              children: [
                                Text("Time Out", style: context.textTheme.headline2),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        loginController.isLogin = true;
                                        loginController.loginMethod = LoginMethods.Unchosen;
                                      },
                                      child: Expanded(
                                          child: Text("Back to Login", style: context.textTheme.headline3, textAlign: TextAlign.center))),
                                )
                              ],
                            ))),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                            child: Text(
                              kThanksRegistration.tr,
                              style: context.textTheme.headline4.copyWith(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClayContainer(
                                  emboss: true,
                                  spread: 2,
                                  curveType: CurveType.convex,
                                  color: context.theme.primaryColorDark,
                                  height: widthApp * 0.2,
                                  width: widthApp * 0.2,
                                  borderRadius: 14,
                                  child: Center(
                                    child: Text(time.min == null ? "0" : time.min.toString(), style: context.textTheme.headline2),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(":", style: context.textTheme.headline2.copyWith(fontSize: 30)),
                                SizedBox(width: 8),
                                ClayContainer(
                                  emboss: true,
                                  spread: 2,
                                  curveType: CurveType.convex,
                                  color: context.theme.primaryColorDark,
                                  height: widthApp * 0.2,
                                  width: widthApp * 0.2,
                                  borderRadius: 14,
                                  child: Center(
                                    child: Text(time.sec == null ? "0" : time.sec.toString(), style: context.textTheme.headline2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          XetiaTextField(
                            textInputType: TextInputType.emailAddress,
                            controller: _signUpController.token,
                            hintText: kActivateToken.tr,
                            focusNode: focusController.token,
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: MyButton(
                              color: context.theme.primaryColor,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              text: kVerify.tr,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
