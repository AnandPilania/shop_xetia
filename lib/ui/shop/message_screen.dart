import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/components/_components.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.primaryColorDark,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: XetiaTextField(hintText: 'Search Chats', prefixIcon: Icons.search, suffixIcon: Icons.camera_alt),
            ),
            for (var _ in List.generate(10, (i) => i)) ChatItem(),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
