import 'package:flutter/material.dart';
import 'package:xetia_shop/constants/_constants.dart';
import 'package:get/get.dart';

class DetailBuyButton extends StatelessWidget {
  const DetailBuyButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: widthApp * 0.175,
                height: widthApp * 0.125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xffeaf2f5),
                ),
                child: Center(
                  child: Icon(Icons.shopping_bag,
                      color: context.theme.primaryColor),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: widthApp * 0.7,
                height: widthApp * 0.125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xff3fda9b),
                ),
                child: Center(
                  child: Text(
                    "Buy",
                    style: context.textTheme.headline3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
