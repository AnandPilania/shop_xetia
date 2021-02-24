import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BusinessCardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [context.theme.primaryColor.withOpacity(0.3), context.theme.primaryColor.withOpacity(0.1)],
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "XETIA",
                  style: context.textTheme.headline2,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Muhammad Faisal",
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline3.copyWith(fontWeight: FontWeight.bold, color: context.theme.primaryColorDark),
                    ),
                    Text(
                      "UI/UX Designer",
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline4.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/svg/xetialogo.svg",
                color: context.theme.primaryColor.withOpacity(0.7),
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
