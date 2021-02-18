import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            Text("Product Details", style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Weight", style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
                  Text("1 Kg", style: context.textTheme.headline5),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Condition", style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
                  Text("New", style: context.textTheme.headline5),
                ],
              ),
            ),
            Text("Description", style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
            Text(
              "lorem ipsum lorem ipsumlorem ipsum lorem ipsum",
              style: context.textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Read more",
                style: context.textTheme.headline4.copyWith(color: Colors.blueAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
