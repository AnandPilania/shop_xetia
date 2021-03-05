import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/color_xetia.dart';

class MyButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color color;
  final IconData iconSuffix;

  const MyButton(
      {Key key,
      @required this.onTap,
      @required this.text,
      @required this.color,
      this.iconSuffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: color.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 4,
              offset: Offset(0, 2))
        ],
      ),
      child: FlatButton(
        onPressed: onTap,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: iconSuffix == null
              ? AutoSizeText(
                  text.toUpperCase(),
                  style: context.textTheme.headline2.copyWith(
                    color: kBlack,
                    fontSize: 20,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 20),
                    AutoSizeText(
                      text.toUpperCase(),
                      style: context.textTheme.headline2.copyWith(
                        color: kBlack,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 20, child: Icon(iconSuffix, color: kBlack)),
                  ],
                ),
        ),
      ),
    );
  }
}
