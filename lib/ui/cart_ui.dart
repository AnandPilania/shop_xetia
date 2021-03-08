import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:xetia_shop/models/_model.dart';

class CartUI extends StatefulWidget {
  @override
  _CartUIState createState() => _CartUIState();
}

class _CartUIState extends State<CartUI> {
  FetchNotificationResponse _fetchNotificationResponse;
  List<NotificationItem> notificationList = [];
  final WebSocketChannel channel = IOWebSocketChannel.connect(
      "wss://chat.xetia.io/ws/v1/notif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjE1MzcyNzA2LCJqdGkiOiI3ZDcwZTg2MmM1NjQ0MWQ2YjI0NjU2NmYzMmRjNWRhZiIsInVzZXJfaWQiOiJlYTBlZDM0NC1iNTU0LTQwZWQtOGZkZS0zN2I2MzY5YWJhNzMiLCJ1c2VyX2VudGl0aWVzIjpbeyJlbnRpdHkiOiI3N2UxZTgyNC0zZDEwLTQ0ODctODFkMC1mNDM2MzlkNDJiYjUiLCJlbnRpdHlfdHlwZSI6InNob3AiLCJlbnRpdHlfbmFtZSI6IlRva28gSW5kb25lc2lhIiwiZW50aXR5X3NsdWciOiJ0b2tvLWluZG9uZXNpYSIsInJvbGUiOjF9XX0.IEk_l3K1T9mzP2fAxI39rp1eMBD1Vu78MMkecF9cwZnaPpwcMfId_yqhumHIRdgRv8zMvI_M51J1SJS4_TEe3M86-crOoXjI9rwPIL8yHCkfmLDWiGEqsGfTJ4lyMec_8TMXwMpuxL50nI7hiuNDi_OBslRWAkGCqOUHCfr_mygnQ4L3OWi0kf_9-nDuBAuW6Aq8BP8m8RnlDLiuSD_URmMz5PflxZNW-DR5Bu1_oKZhLqgG1SRGf-QJu8S7pTpYX7PAfbZ_LSjDD82MFvIATZZoHNihiVlgK-rYvZML9hSDYWKXAlzJ2j2LiIVr276tuV3IfvqbZztmmVUUu4qTDdZLml9_fkRLThbXDrRDVbDrIT3qiO5F36aIRh22AkbxADUkqt4CiwtOpQ9dr0PwMfm8DdzGDPEV2icvSgVT5ep9bePndWweVT-GvWrnr46HpR0K8aKpW9Cm-yeh2iibBszakt5QWPY9LfZKBKG7uBABHZd3U7kKQW0R6UcfOJQ7qgNbH8S169ryqCUAxzV1kdDTtFb11g7G57IzwRAWZziw_pOhmQUvlkYdCuIsEqfcJDuMzf4C8m0gHOcBoJmosSxFTAs1iXCk_hV2zIFtdbkSBTrGyk5yENxKFbnqTJolf-50PeHIVJyDs9zn4RkzIp-WoZBZ6JReInNJmVhw0D8");

  @override
  void initState() {
    _listenToData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.hasData &&
                    jsonDecode(snapshot.data)["info"] ==
                        "fetch_notifications") {
                  _fetchNotificationResponse =
                      fetchNotificationResponseFromJson(snapshot.data);
                  notificationList.clear();
                  notificationList
                      .addAll(_fetchNotificationResponse.notifications);
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: !snapshot.hasData
                      ? Text('No Data')
                      : Column(
                          children: List.generate(
                            notificationList.length,
                            (index) => NotificationItemWidget(
                              notificationItem: notificationList[index],
                            ),
                          ),
                        ),
                );
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: () => _listenToData(),
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  _listenToData() {
    channel.sink.add(jsonEncode(
        {"command": "fetch_notifications", "status": "all", "limit": 10}));
  }
}

class NotificationItemWidget extends StatelessWidget {
  final NotificationItem notificationItem;

  const NotificationItemWidget({Key key, this.notificationItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.theme.primaryColorDark),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            notificationItem.title,
            style: context.textTheme.headline3,
          ),
          Text(
            notificationItem.message,
            style: context.textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
