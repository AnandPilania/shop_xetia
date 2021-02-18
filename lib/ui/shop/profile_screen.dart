import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../ui/components/profie_sheet/_component.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.primaryColorDark,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ProfileCard(),
            MyBalance(),
            SizedBox(height: 25),
            Container(padding: EdgeInsets.symmetric(horizontal: 25), child: Budgeting()),
            SizedBox(height: 25),
            Container(padding: EdgeInsets.symmetric(horizontal: 25), child: HistoryTransaction()),
            SizedBox(height: 125),
            // ProductReview(),
            // SizedBox(height: 25),
            // CarouselCardContainer(),
            // SizedBox(height: 25),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   child: MyButton(color: Colors.green, onTap: () async {}, text: "Logout"),
            // ),
            // SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
