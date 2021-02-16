import 'package:flutter/material.dart';
import 'package:xetia_shop/ui/components/_components.dart';

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
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.camera))),
          ),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          ChatItem(),
          SizedBox(height: 48),
        ],
      ),
    );
  }
}
