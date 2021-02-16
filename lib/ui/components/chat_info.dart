import 'package:flutter/material.dart';

class ChatInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Taylor Swift",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        SizedBox(height: 5),
        Text(
          "Lorem Ipsum Dolor sit Amet Lorem Ipsum Dolor sit Amet Lorem Ipsum Dolor sit Amet",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
