import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/language/_components.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class AddProductSheet extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          SheetHeader(
            title: kAddProduct.tr,
            onTap: () {
              Get.back();
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  AddProductPicture(),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: context.theme.primaryColorDark,
                    ),
                    padding: EdgeInsets.all(20),
                    child: ExpandablePanel(
                      header: Text(kProductDetail.tr,
                          style: context.textTheme.headline3),
                      expanded: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            ProductInformation(),
                            SizedBox(height: 20),
                            SellerInformation(),
                            StockInformation(),
                            SizedBox(height: 20),
                            DeliveryInformation(),
                            SizedBox(height: 20),
                            PostageInformation(),
                          ],
                        ),
                      ),
                      theme: ExpandableThemeData(
                        iconColor: context.theme.primaryColor,
                        alignment: Alignment.centerLeft,
                        bodyAlignment: ExpandablePanelBodyAlignment.center,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: MyButton(
                        color: context.theme.primaryColor,
                        onTap: () {},
                        text: kAddProduct.tr),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
