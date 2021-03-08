import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:xetia_shop/constants/color_xetia.dart';
import 'package:xetia_shop/language/language_key.dart';

class MyBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: context.theme.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    kMyBalance.tr,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline1.copyWith(
                        color: kBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(width: 140),
                  Text(
                    kSeeDetails.tr,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline5.copyWith(color: kBlack),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: context.theme.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        kBalance.tr,
                        textAlign: TextAlign.center,
                        style: context.textTheme.headline4
                            .copyWith(fontSize: 16, color: kWhite),
                      ),
                      SizedBox(height: 3),
                      AutoSizeText(
                        "Rp. 1000000",
                        textAlign: TextAlign.center,
                        style: context.textTheme.headline4.copyWith(
                            fontSize: 16,
                            color: kBlack,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.copyright_rounded,
                            color: context.theme.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        kPoint.tr,
                        textAlign: TextAlign.center,
                        style: context.textTheme.headline4
                            .copyWith(fontSize: 16, color: kWhite),
                      ),
                      SizedBox(height: 3),
                      AutoSizeText(
                        "2880",
                        textAlign: TextAlign.center,
                        style: context.textTheme.headline4.copyWith(
                            fontSize: 16,
                            color: kBlack,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
