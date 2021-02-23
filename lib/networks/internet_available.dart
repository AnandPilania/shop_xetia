import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

Future<bool> intenetAvailable() async {
  ConnectivityResult connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    print("offline");
    return false;
  } else if (connectivityResult == ConnectivityResult.mobile) {
    print("online with mobile seluler");
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    print("online");
    return true;
  }
}
