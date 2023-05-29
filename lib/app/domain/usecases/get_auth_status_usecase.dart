import 'package:kampus/app/domain/repository/i_user_respository.dart';
import 'package:kampus/core/service_locator.dart';

class GetAuthStatusUseCase {
  late final IUserRepository _userRepository;

  GetAuthStatusUseCase() {
    _userRepository = serviceLocator<IUserRepository>();
  }

  Future<bool> call() async {
    var token = await _userRepository.getToken();
    var userId = await _userRepository.getUserId();
    return token != null && userId != null;
  }
}
