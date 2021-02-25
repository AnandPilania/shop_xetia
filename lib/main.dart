import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xetia_shop/controllers/focus_node.dart';
import 'package:xetia_shop/ui/landing_page/sign_in_ui.dart';

import './controllers/_controllers.dart';

void main() async {
  await GetStorage.init();
  Get.lazyPut(() => LandingPageController());
  Get.lazyPut(() => HeaderHomeController());
  Get.lazyPut(() => FocusController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeController = Get.put(ThemeController());
  final signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop_Xetia',
      theme: themeController.theme,
      home: signInController.hasLoggedIn,
    );
  }
}
