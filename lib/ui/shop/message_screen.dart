import 'package:flutter/material.dart';

import '../../ui/components/_components.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Chats',
                prefixIcon: IconTheme(
                    child: Icon(Icons.search),
                    data: Theme.of(context).iconTheme),
                suffixIcon: IconTheme(
                    child: Icon(Icons.camera),
                    data: Theme.of(context).iconTheme),
              ),
            ),
          ),
          for (var _ in List.generate(10, (i) => i)) ChatItem(),
          SizedBox(height: 48),
        ],
      ),
    );
  }
}
