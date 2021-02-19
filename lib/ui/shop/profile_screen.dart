import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:xetia_shop/constants/enums.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/_ui.dart';
import 'package:xetia_shop/ui/components/_components.dart';

import '../../ui/components/profile_sheet/_component.dart';

class ProfileScreen extends StatelessWidget {
  final signInController = Get.put(SignInController());
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.primaryColorDark,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ProfileCard(),
            MyBalance(),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Budgeting(),
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: HistoryTransaction(),
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ProductReview(),
            ),
            SizedBox(height: 25),
            CarouselCardContainer(),
            SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: MyButton(
                  color: context.theme.primaryColor,
                  onTap: () {
                    loginController.setMethod(LoginMethods.Unchosen);
                    signInController.changeLoginState(false);
                    Get.off(SignInUI());
                  },
                  text: "Logout"),
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
