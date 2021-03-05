import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:xetia_shop/constants/color_xetia.dart';

class ListHistory extends StatelessWidget {
  final Color color;
  final bool isDark;
  final String text;
  final String date;
  final String price;
  final Color colorPrice;
  final IconData icon;

  const ListHistory(
      {Key key,
      this.color,
      this.isDark,
      this.text,
      this.date,
      this.price,
      this.colorPrice,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      textAlign: TextAlign.left,
                      style: context.textTheme.headline5,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      date,
                      textAlign: TextAlign.left,
                      style: context.textTheme.headline5,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  price,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorPrice,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 1,
              width: double.infinity,
              color: kBlack.withOpacity(0.3),
            ),
          )
        ],
      ),
    );
  }
}
