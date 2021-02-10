import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xetia_shop/controllers/controllers.dart';

import 'other.dart';

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    final CountController c = Get.put(CountController());

    return Scaffold(
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
        body: Center(
            child: RaisedButton(
                child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}
