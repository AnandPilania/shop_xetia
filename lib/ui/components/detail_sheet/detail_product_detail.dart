import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/language/language_key.dart';

class DetailProductDetail extends StatelessWidget {
  const DetailProductDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.theme.primaryColorDark, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(kProductDetails.tr, style: context.textTheme.headline3),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(kWeight.tr, style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
                  Text("1 " + kKilogram.tr, style: context.textTheme.headline5),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(kCondition.tr, style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
                  Text(kNew.tr, style: context.textTheme.headline5),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(kDescription.tr, style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
            ),
            Text(
              "lorem ipsum lorem ipsumlorem ipsum lorem ipsum",
              style: context.textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                kReadMore.tr,
                style: context.textTheme.headline4.copyWith(color: Colors.blueAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
