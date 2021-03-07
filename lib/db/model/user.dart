import '../user_database_provider.dart';

class UserDatabase {
  int id;
  int role;
  int is_oauth;
  String entityType;
  String entityId;
  String entityName;
  String userId;
  String first;
  String last;
  String photo;
  String refreshToken;
  String accessToken;

  UserDatabase(
      {this.id,
      this.role,
      this.is_oauth,
      this.entityType,
      this.entityId,
      this.entityName,
      this.userId,
      this.first,
      this.last,
      this.photo,
      this.refreshToken,
      this.accessToken});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      UserProvider.ROLE: role,
      UserProvider.ISOAUTH: is_oauth,
      UserProvider.ENTITY_NAME: entityName,
      UserProvider.ENTITY_ID: entityId,
      UserProvider.ENTITY_TYPE: entityType,
      UserProvider.USER_ID: userId,
      UserProvider.FIRST: first,
      UserProvider.LAST: last,
      UserProvider.PHOTO: photo,
      UserProvider.REFRESH_TOKEN: refreshToken,
      UserProvider.ACCESS_TOKEN: accessToken,
    };

    if (id != null) {
      map[UserProvider.COLUMN_ID] = id;
    }

    return map;
  }

  UserDatabase.fromMap(Map<String, dynamic> map) {
    id = map[UserProvider.COLUMN_ID];
    role = map[UserProvider.ROLE];
    is_oauth = map[UserProvider.ISOAUTH];
    entityType = map[UserProvider.ENTITY_TYPE];
    entityId = map[UserProvider.ENTITY_ID];
    entityName = map[UserProvider.ENTITY_NAME];
    userId = map[UserProvider.USER_ID];
    first = map[UserProvider.FIRST];
    last = map[UserProvider.LAST];
    photo = map[UserProvider.PHOTO];
    refreshToken = map[UserProvider.REFRESH_TOKEN];
    accessToken = map[UserProvider.ACCESS_TOKEN];
  }
}
