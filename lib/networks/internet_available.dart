import 'dart:io';

import 'package:connectivity/connectivity.dart';

Future<bool> internetAvailable() async {
  ConnectivityResult connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    print("offline");
    return false;
  } else if (connectivityResult == ConnectivityResult.mobile) {
    print("online with mobile secular");
    return retryConnection();
  } else if (connectivityResult == ConnectivityResult.wifi) {
    print("online");
    return retryConnection();
  }

  return null;
}

Future<bool> retryConnection() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      return true;
    }
  } on SocketException catch (_) {
    print('not connected : $_');
    return false;
  }
}
