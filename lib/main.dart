import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/_ui.dart';
import 'package:xetia_shop/utils/_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xetia_shop/controllers/_controllers.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop_Xetia',
      darkTheme: Themes.dark,
      home: HomeUI(),
    );
  }
}
