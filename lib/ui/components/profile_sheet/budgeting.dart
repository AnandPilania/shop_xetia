import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import 'detail_graph.dart';

class Budgeting extends StatelessWidget {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Budgeting",
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline1.copyWith(fontSize: 16),
                  ),
                  SizedBox(width: 140),
                  Text(
                    "See Details",
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline5.copyWith(color: context.theme.primaryColor),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: 113,
                    height: 113,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff6b96fa),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DetailGraph(text: "Food and Drink", color: Color(0xff6b96fa)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DetailGraph(text: "Wifi Bills", color: Color(0xFFf1bb41)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DetailGraph(text: "House Bills", color: Color(0xFF25C685)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
