import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:xetia_shop/db/_db.dart';
import 'package:xetia_shop/models/_model.dart';

class WebSocketNotifController extends GetxController {
  String accessToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjE1MzczNzIwLCJqdGkiOiJhOGJmNzhkMWQ2Mzc0NmYxYjhhNjUzZWJkZWYyMDU5ZSIsInVzZXJfaWQiOiJlYTBlZDM0NC1iNTU0LTQwZWQtOGZkZS0zN2I2MzY5YWJhNzMiLCJ1c2VyX2VudGl0aWVzIjpbeyJlbnRpdHkiOiI3N2UxZTgyNC0zZDEwLTQ0ODctODFkMC1mNDM2MzlkNDJiYjUiLCJlbnRpdHlfdHlwZSI6InNob3AiLCJlbnRpdHlfbmFtZSI6IlRva28gSW5kb25lc2lhIiwiZW50aXR5X3NsdWciOiJ0b2tvLWluZG9uZXNpYSIsInJvbGUiOjF9XX0.dpK_Ne8-lfUGNeHU8CPpSofZqwZ_52SQfaNYqKyNSZKA9LbDxo6tIJcvRBKlF3ptmF0h2kdUsaBzCjT0WJqmB-r6JcI0KPvl2Dyj5pTy01SxU6ydMlrbStqBNbDnMdq5OX58Z940rlRFc7OjT-VNfSTlXNOTh5ml9hNemhpvirKJW1T0T8Tkh9wwj-twyiwxw1mfisz739zQhis79fHAPHEx0G28FlPlqc97nciuIvxgduyF3PYvANQB3Wz-VFAUztwNGRrXRknzJGAA9cuuFvBhXLCT2jicPT5q93IilPYZ4r5ajqotzZm5CMH7usSeAllVId87tOEnxLuhtFY92Tmnje1KW5O5V8Kt2_xTeZTfOLhjmjCHi3GmhiWuPWIdRCPACe93wJHi7l7SZHTXaHOPKRJ2XI_NkV0HgWabYSE-xPp3WTGhvHNtHsqTVgCnFRwd_6hyzBVhjeyCJcTzU52SsGM7Gphl2qKINFFjLJZ4WBIjFsf78-rhyJvIMSTJr86eJannglpFtExPPLYPFuXxHZZ1bqz88HQF98Z-NVq7R0AyBeHBgxdcwmGy5rnNMYIMP0vDc";
  WebSocket webSocket;
  StreamSubscription listenSubscription;
  RxList<NotificationItem> notificationList = List<NotificationItem>().obs;
  Rx<FetchNotificationResponse> _fetchNotificationResponse =
      FetchNotificationResponse().obs;

  @override
  void onInit() {
    getToken();
    subscribeWebSocket();
    super.onInit();
  }

  @override
  void dispose() {
    listenSubscription?.cancel();
    webSocket?.close();
    super.dispose();
  }

  void subscribeWebSocket() async {
    webSocket = await WebSocket.connect(
      'wss://chat.xetia.io/ws/v1/notif?token=$accessToken',
      headers: <String, String>{
        'Authorization': accessToken,
      },
    );
    if (webSocket != null) {
      listenSubscription = webSocket.listen(
        (dynamic data) {
          print('New message: $data');
          _fetchNotificationResponse(data);
          notificationList.clear();
          notificationList
              .addAll(_fetchNotificationResponse.value.notifications);
        },
      );
    }
  }

  void getToken() async {
    final user = await UserProvider.db.getUser();

    print("Token Access ${user.accessToken}");
    accessToken = user.accessToken;
  }
}
