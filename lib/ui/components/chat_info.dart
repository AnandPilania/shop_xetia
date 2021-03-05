import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ChatInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Faker().person.name(),
          textAlign: TextAlign.center,
          style: context.textTheme.headline3.copyWith(fontSize: 14),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        SizedBox(height: 5),
        Text(
          Faker().lorem.sentence(),
          textAlign: TextAlign.center,
          style: context.textTheme.headline3
              .copyWith(fontSize: 12, fontWeight: FontWeight.normal),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
