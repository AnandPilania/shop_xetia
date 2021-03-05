import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/constants/dimens.dart';

class BoxTimer extends StatelessWidget {
  final CurrentRemainingTime time;
  final bool isMinute;
  const BoxTimer({
    Key key,
    @required this.time,
    @required this.isMinute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      emboss: true,
      spread: 2,
      curveType: CurveType.convex,
      color: context.theme.primaryColorDark,
      height: widthApp * 0.15,
      width: widthApp * 0.15,
      borderRadius: 14,
      child: Center(
        child: isMinute == false
            ? Text(time != null ? (time.sec == null ? "0" : time.sec.toString()) : "0", style: context.textTheme.headline2)
            : Text(time != null ? (time.min == null ? "0" : time.min.toString()) : "0", style: context.textTheme.headline2),
      ),
    );
  }
}
