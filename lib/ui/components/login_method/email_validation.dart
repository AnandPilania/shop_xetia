import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';

import '../../../constants/_constants.dart';
import '../../../controllers/_controllers.dart';
import '../../../language/_components.dart';
import '../../../ui/components/_components.dart';

class RegisterUI3 extends StatelessWidget {
  final FocusNodeController focusController = Get.find();
  final ToggleController _toggleController = Get.find();
  final TokenTimeController tokenTimeController =
      Get.put(TokenTimeController());
  final TextFieldController _textFieldController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: !_toggleController.isTicking
            ? SizedBox(
                height: (heightApp + paddingTop) * 0.4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: AutoSizeText(
                            kTokenTimeDown.tr,
                            style: context.textTheme.headline4.copyWith(fontSize: 16),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: MyButton(
                            color: context.theme.primaryColor,
                            onTap: () {
                              tokenTimeController.startController();
                              FocusScope.of(context).unfocus();
                            },
                            text: kResendActivationKey.tr,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
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
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: AutoSizeText(
                                        kThanksRegistration.tr,
                                        style: context.textTheme.headline4.copyWith(fontSize: 14),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          BoxTimer(isMinute: true, time: time),
                                          SizedBox(width: 8),
                                          Text(":", style: context.textTheme.headline2.copyWith(fontSize: 30)),
                                          SizedBox(width: 8),
                                          BoxTimer(isMinute: false, time: time),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    XetiaTextField(
                                      textInputType: TextInputType.emailAddress,
                                      controller: _textFieldController.token,
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
                                          loginController.loginMethod = LoginMethods.Email;
                                          loginController.isLogin = true;
                                          tokenTimeController.endTicking();
                                          Get.to(SuccessRegister());
                                          // FocusScope.of(context).unfocus();
                                          //signUpController.resEmailVerify(
                                          //    context: context);
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
              )));
  }
}
