import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xetia_shop/constants/_constants.dart';

class XetiaLogoWidget extends StatelessWidget {
  const XetiaLogoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthApp * 0.4,
      height: widthApp * 0.4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xff616569),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/svg/xetialogo.svg"),
          SizedBox(height: 10),
          SvgPicture.asset("assets/svg/xetiafont.svg"),
        ],
      ),
    );
  }
}
