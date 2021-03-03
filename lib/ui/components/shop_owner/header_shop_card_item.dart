import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderShopCardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset("assets/png/splash.png", fit: BoxFit.cover),
    );
  }
}
