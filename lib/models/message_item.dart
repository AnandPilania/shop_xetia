import 'dart:convert';

class MessageItem {
  final String content;
  final String reply;
  final bool isRight;

  MessageItem({this.content, this.isRight, this.reply});

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'reply': reply,
      'isRight': isRight,
    };
  }

  factory MessageItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MessageItem(
      content: map['content'],
      reply: map['reply'],
      isRight: map['isRight'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageItem.fromJson(String source) =>
      MessageItem.fromMap(json.decode(source));
}
