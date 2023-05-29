import 'package:kampus/app/data/datasource/user/auth_local_datasource.dart';
import 'package:kampus/app/domain/repository/i_user_respository.dart';
import 'package:kampus/core/service_locator.dart';

class UserRepository implements IUserRepository {
  late AuthLocalDataSource authLocalDataSource;

  UserRepository() {
    authLocalDataSource = serviceLocator<AuthLocalDataSource>();
  }

  @override
  Future<String?> getUserId() async {
    await authLocalDataSource.getUserId();
    return null;
  }

  @override
  Future<String?> getToken() async {
    await authLocalDataSource.getToken();
    return null;
  }
}
