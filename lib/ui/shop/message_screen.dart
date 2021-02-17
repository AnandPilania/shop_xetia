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
                decoration: InputDecoration(hintText: 'Search Chats', prefixIcon: Icon(Icons.search), suffixIcon: Icon(Icons.camera))),
          ),
          for (var _ in List.generate(10, (i) => i)) ChatItem(),
          SizedBox(height: 48),
        ],
      ),
    );
  }
}
