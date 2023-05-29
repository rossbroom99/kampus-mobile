abstract interface class IUserRepository {
  Future<String?> getUserId();
  Future<String?> getToken();
}
