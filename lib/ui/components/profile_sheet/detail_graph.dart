import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import 'circle_graph.dart';

class DetailGraph extends StatelessWidget {
  final String text;
  final Color color;

  const DetailGraph({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleGraph(
          size: 20,
          colorCircle: color,
        ),
        SizedBox(width: 16),
        Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.headline4,
        ),
      ],
    );
  }
}
