import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/ui/_ui.dart';

void main() async {
  await GetStorage.init();
  initController();
  runApp(MyApp());
}

void initController() {
  Get.lazyPut(() => BestSellerController());
  Get.lazyPut(() => HeaderHomeController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop_Xetia',
      theme: themeController.theme,
      home: SignInUI(),
    );
  }
}
