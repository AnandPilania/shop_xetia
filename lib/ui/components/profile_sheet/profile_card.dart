import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        color: context.theme.primaryColorDark,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    "https://picsum.photos/250?image=9",
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tince",
                    style: context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Edit Profile",
                    style: context.textTheme.headline5,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  child: Icon(
                Icons.keyboard_arrow_right,
              )),
            )
          ],
        ));
  }
}
