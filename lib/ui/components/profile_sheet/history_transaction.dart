import 'package:flutter/material.dart';
import 'package:xetia_shop/constants/color_xetia.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:xetia_shop/language/language_key.dart';
import 'package:get/get.dart';

import 'badges.dart';
import 'list_history.dart';

class HistoryTransaction extends StatefulWidget {
  @override
  _HistoryTransactionState createState() => _HistoryTransactionState();
}

class _HistoryTransactionState extends State<HistoryTransaction> {
  DateTime selectedDate = DateTime.now();
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime.now();
  bool isLoadDate = true;
  List<String> chipName;

  textInputSelectDate(BuildContext context, Color color, bool isDark, String text) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: text,
      cancelText: kCancel.tr,
      confirmText: kOk.tr,
      builder: (context, child) {
        return DatePickerTheme(child: child, color: color, isDark: isDark);
      },
    );
    if (picked != null && picked != selectedDate) {
      return picked;
    } else {
      return DateTime.now();
    }
  }

  void getDate() async {
    firstDate = await textInputSelectDate(context, Colors.green, true, kFirstDate.tr);
    Future.delayed(const Duration(milliseconds: 1000), () async {
      lastDate = await textInputSelectDate(context, Colors.blue, true, kLastDate.tr);
    });
  }

  @override
  void initState() {
    super.initState();
    chipName = [
      kAll.tr,
      kPayment.tr,
      kAcceptance.tr,
      kOutput.tr,
      kInput.tr,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                kHistoryTx.tr,
                textAlign: TextAlign.center,
                style: context.textTheme.headline1.copyWith(fontSize: 16),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.theme.primaryColorLight.withOpacity(0.3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                  ),
                  isLoadDate
                      ? Text(
                          "${firstDate.toString().substring(0, 10)} - ${lastDate.toString().substring(0, 10)}",
                          textAlign: TextAlign.center,
                          style: context.textTheme.headline4,
                        )
                      : SizedBox(height: 50),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        isLoadDate = false;
                      });
                      getDate();
                      setState(() {
                        isLoadDate = true;
                      });
                    },
                    child: Container(
                        child: Icon(
                      Icons.arrow_downward,
                    )),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    chipName.length,
                    (index) => Badges(
                      txtColor: kWhite,
                      bgColor: context.theme.primaryColor,
                      text: chipName[index],
                      color: context.theme.primaryColorLight,
                      isDark: true,
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListHistory(
                      text: kPayment.tr,
                      date: "1 Dec 2020",
                      price: "-21.285",
                      icon: Icons.money,
                      color: context.theme.primaryColorLight,
                      isDark: context.isDarkMode,
                      colorPrice: Colors.red),
                  ListHistory(
                      text: kCashBack.tr,
                      date: "1 Dec 2020",
                      price: "+41.285",
                      icon: Icons.money,
                      color: context.theme.primaryColorLight,
                      isDark: context.isDarkMode,
                      colorPrice: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DatePickerTheme extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isDark;

  const DatePickerTheme({Key key, this.color, this.isDark, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(primaryColorDark: Colors.white, primaryColorLight: Colors.black).copyWith(
            primaryColor: color,
            colorScheme: ColorScheme.light(
              primary: color,
              onPrimary: Colors.white,
              surface: color,
              onSurface: Colors.black,
            )),
        child: child);
  }
}
