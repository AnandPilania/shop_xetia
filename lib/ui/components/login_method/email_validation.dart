import 'package:auto_size_text/auto_size_text.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/controllers/focus_node_controller.dart';
import 'package:xetia_shop/controllers/time_token_controller.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class RegisterUI3 extends StatelessWidget {
  final LandingPageController loginController = Get.find();
  final FocusNodeController focusController = Get.find();
  final TokenTimeController tokenTimeController =
      Get.put(TokenTimeController());
  final TextFieldController _textFieldController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: !tokenTimeController.isTicking
            ? SizedBox(
                height: (heightApp + paddingTop) * 0.4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: AutoSizeText(
                            kTokenTimeDown.tr,
                            style: context.textTheme.headline4
                                .copyWith(fontSize: 16),
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: AutoSizeText(
                                        kThanksRegistration.tr,
                                        style: context.textTheme.headline4
                                            .copyWith(fontSize: 14),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClayContainer(
                                            emboss: true,
                                            spread: 2,
                                            curveType: CurveType.convex,
                                            color:
                                                context.theme.primaryColorDark,
                                            height: widthApp * 0.15,
                                            width: widthApp * 0.15,
                                            borderRadius: 14,
                                            child: Center(
                                              child: Text(
                                                  time != null
                                                      ? (time.min == null
                                                          ? "0"
                                                          : time.min.toString())
                                                      : "0",
                                                  style: context
                                                      .textTheme.headline2),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(":",
                                              style: context.textTheme.headline2
                                                  .copyWith(fontSize: 30)),
                                          SizedBox(width: 8),
                                          ClayContainer(
                                            emboss: true,
                                            spread: 2,
                                            curveType: CurveType.convex,
                                            color:
                                                context.theme.primaryColorDark,
                                            height: widthApp * 0.15,
                                            width: widthApp * 0.15,
                                            borderRadius: 14,
                                            child: Center(
                                              child: Text(
                                                  time != null
                                                      ? (time.sec == null
                                                          ? "0"
                                                          : time.sec.toString())
                                                      : "0",
                                                  style: context
                                                      .textTheme.headline2),
                                            ),
                                          ),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
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
              )));
  }
}
