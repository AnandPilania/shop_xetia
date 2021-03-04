import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './controllers/_controllers.dart';
import './utils/localization.dart';

void main() async {
  await GetStorage.init();
  initLazyController();
  runApp(MyApp());
}

void initLazyController() {
  Get.lazyPut(() => LandingPageController());
  Get.lazyPut(() => HeaderHomeController(), fenix: true);
  Get.lazyPut(() => FocusNodeController(), fenix: true);
  Get.lazyPut(() => LocalizationController());
  Get.lazyPut(() => ProductController(), fenix: true);
  Get.lazyPut(() => OptionButtonController(), fenix: true);
  Get.lazyPut(() => TextFieldController(), fenix: true);
}

class MyApp extends StatelessWidget {
  final themeController = Get.put(ThemeController());
  final signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Localization.locale,
      fallbackLocale: Localization.fallbackLocale,
      translations: Localization(),
      title: 'Shop_Xetia',
      theme: themeController.theme,
      home: signInController.hasLoggedIn,
    );
  }
}
