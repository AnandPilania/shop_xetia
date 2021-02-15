import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

void main() async {
  await GetStorage.init();
  initController();
  runApp(MyApp());
}

void initController() {
  Get.lazyPut(() => BestSellerController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    final signInController = Get.put(SignInController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop_Xetia',
      theme: themeController.theme,
      home: signInController.hasLoggedIn,
    );
  }
}
