import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/dummy_view.dart';
import 'package:xetia_shop/utils/theme.dart' as xetiaTheme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop_Xetia',
      theme: xetiaTheme.Themes.light,
      darkTheme: xetiaTheme.Themes.dark,
      home: DummyThemeing(),
    );
  }
}
