import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/_ui.dart';
import 'package:xetia_shop/utils/_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop_Xetia',
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: SignIn(),
    );
  }
}
