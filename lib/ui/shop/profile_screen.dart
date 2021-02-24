import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class ProfileScreen extends StatelessWidget {
  // final SignInController signInController = Get.put(SignInController());
  // final LandingPageController loginController =
  //     Get.find<LandingPageController>();
  // final HeaderHomeController headerHomeController =
  //     Get.find<HeaderHomeController>();
  final LogoutController logoutController = Get.put(LogoutController());

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
                    // LoadingOverlay loading = LoadingOverlay.of(context);

                    // loading.show();
                    // headerHomeController.changeHeader(
                    //     position: 0, isSwiped: false);
                    // loginController.loginMethod = LoginMethods.Unchosen;
                    // signInController.changeLoginState(false);
                    // Get.off(OnBoardingPage());
                    logoutController.logout(context: context);
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
