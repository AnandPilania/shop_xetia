import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/dimens.dart';
import '../../../language/language_key.dart';
import '../../../ui/components/button_flat.dart';

class SuccessPage extends StatelessWidget {
  final bool isPasschange;
  const SuccessPage({Key key, @required this.isPasschange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColorDark,
      body: Padding(
        padding: EdgeInsets.only(top: paddingTop),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Get.isDarkMode ? SvgPicture.asset("assets/svg/success_sign_up.svg") : SvgPicture.asset("assets/svg/success_light.svg"),
            SizedBox(height: heightApp * 0.075),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AutoSizeText(
                isPasschange ? kSuccessPassChangeText.tr : kSuccessRegisterText.tr,
                style: context.textTheme.headline2.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MyButton(
                text: kLogin,
                onTap: () {
                  Get.back();
                },
                color: context.theme.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
