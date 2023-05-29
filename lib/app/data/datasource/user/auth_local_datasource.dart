import 'package:kampus/app/data/datasource/user/storage_local_datasource.dart';

class AuthLocalDataSource extends StorageLocalDataSource {
  static const _tokenKey = 'token';
  static const _userIdKey = 'userId';

  AuthLocalDataSource() : super();

  Future<void> persistUserIdAndToken(String userId, String token) async {
    await write(key: _userIdKey, value: userId);
    await write(key: _tokenKey, value: token);
  }

  Future<void> deleteToken() async {
    return delete(key: _tokenKey);
  }

  Future<void> deleteUserId() async {
    return delete(key: _userIdKey);
  }

  Future<String?> getUserId() async {
    return read(key: _userIdKey);
  }

  Future<String?> getToken() async {
    return read(key: _tokenKey);
  }
}
