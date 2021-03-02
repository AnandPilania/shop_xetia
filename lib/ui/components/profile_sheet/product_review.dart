import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/_controllers.dart';
import 'package:xetia_shop/language/_components.dart';

class ProductReview extends StatelessWidget {
  final Duration animDuration = const Duration(milliseconds: 250);
  final ChartProductReviewController controller = Get.put(ChartProductReviewController());

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.theme.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                kHalalProductReview.tr,
                style: context.textTheme.headline2.copyWith(fontWeight: FontWeight.bold, color: context.theme.primaryColorLight),
              ),
              Text(
                '2021',
                style: context.textTheme.headline3.copyWith(color: context.theme.primaryColor),
              ),
              const SizedBox(
                height: 38,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Obx(
                    () => BarChart(
                      mainBarData(context),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartData mainBarData(BuildContext context) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: context.theme.primaryColorLight,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(), context.textTheme.headline5.copyWith(color: context.theme.primaryColorDark));
            }),
        touchCallback: (barTouchResponse) {
          if (barTouchResponse.spot != null && barTouchResponse.touchInput is! FlPanEnd && barTouchResponse.touchInput is! FlLongPressEnd) {
            controller.currentTouchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
          } else {
            controller.currentTouchedIndex = -1;
          }
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(context),
    );
  }

  List<BarChartGroupData> showingGroups(BuildContext context) => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, context, isTouched: i == controller.currentTouchedIndex);
          case 1:
            return makeGroupData(1, 6.5, context, isTouched: i == controller.currentTouchedIndex);
          case 2:
            return makeGroupData(2, 5, context, isTouched: i == controller.currentTouchedIndex);
          case 3:
            return makeGroupData(3, 7.5, context, isTouched: i == controller.currentTouchedIndex);
          case 4:
            return makeGroupData(4, 9, context, isTouched: i == controller.currentTouchedIndex);
          case 5:
            return makeGroupData(5, 11.5, context, isTouched: i == controller.currentTouchedIndex);
          case 6:
            return makeGroupData(6, 6.5, context, isTouched: i == controller.currentTouchedIndex);
          default:
            return null;
        }
      });

  BarChartGroupData makeGroupData(
    int x,
    double y,
    BuildContext context, {
    bool isTouched = false,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [context.theme.primaryColor] : [context.theme.primaryColorLight],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [context.theme.primaryColorDark],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProductReview extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: context.theme.scaffoldBackgroundColor,
//         child: Container(
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(vertical: 20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: context.theme.scaffoldBackgroundColor,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 blurRadius: 8,
//               ),
//             ],
//           ),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "Halal Product Review",
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "2021",
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//                 Container(
//                   child: SizedBox(
//                     height: 300,
//                   ),
//                 )
//               ]),
//         ));
//   }
// }
