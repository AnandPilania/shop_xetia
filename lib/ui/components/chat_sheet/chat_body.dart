import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
          ],
        ),
      ),
    );
  }
}

class BubbleChat extends StatelessWidget {
  final String text;
  final bool isRight;

  const BubbleChat({Key key, this.text, this.isRight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bubble(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Text(
          text,
          style: context.textTheme.headline5.copyWith(color: Colors.black),
        ),
      ),
      color: isRight ? context.theme.primaryColor : Colors.white,
      margin: isRight
          ? BubbleEdges.fromLTRB(
              MediaQuery.of(context).size.width * 0.2, 10, 0, 0)
          : BubbleEdges.fromLTRB(
              0, 10, MediaQuery.of(context).size.width * 0.2, 0),
      nip: isRight ? BubbleNip.rightBottom : BubbleNip.leftBottom,
      nipWidth: 4,
      radius: Radius.circular(10),
      nipRadius: 1,
    );
  }
}
