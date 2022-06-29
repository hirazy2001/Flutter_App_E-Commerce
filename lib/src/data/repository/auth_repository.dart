abstract class AuthRepository{

  Future<void> openApp();

  Future<void> login();

  Future<void> logout();

}