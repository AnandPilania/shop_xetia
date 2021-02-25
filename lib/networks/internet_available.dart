import 'package:connectivity/connectivity.dart';

Future<bool> internetAvailable() async {
  ConnectivityResult connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    print("offline");
    return false;
  } else if (connectivityResult == ConnectivityResult.mobile) {
    print("online with mobile secular");
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    print("online");
    return true;
  }

  return null;
}
