import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/ui/components/_components.dart';

class DetailRelatedProduct extends StatelessWidget {
  final int indexSwiper;

  const DetailRelatedProduct({Key key, this.indexSwiper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.theme.primaryColorDark,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Related Product",
                    style: context.textTheme.headline5
                        .copyWith(fontWeight: FontWeight.bold)),
                Text("See All >", style: context.textTheme.headline5),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailRelatedProductItem(indexSwiper: indexSwiper),
                  DetailRelatedProductItem(indexSwiper: indexSwiper),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
