import 'package:get/get.dart';
import 'package:xetia_shop/db/model/_model_db.dart';
import 'package:xetia_shop/db/user_database_provider.dart';

class UserDatabaseController extends GetxController {
  String roleName = "";
  String entityID = "";
  String userID = "";
  String first = "";
  String last = "";
  String photo = "";
  String refreshT = "";
  String accessT = "";
  int role;

  @override
  void onInit() {
    // TODO: implement onInit
    getUser();
    super.onInit();
  }

  void getUser() async {
    await UserProvider.db.getUser().then((User value) {
      role = value.role;
      roleName = value.roleName;
      entityID = value.entityId;
      userID = value.userId;
      first = value.first;
      last = value.last;
      photo = value.photo;
      refreshT = value.refreshToken;
      accessT = value.accessToken;
    });
  }
}
