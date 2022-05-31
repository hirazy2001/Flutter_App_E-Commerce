class RegisterRequest{
  final String nameOrEmail;
  final String username;
  final String password;

  RegisterRequest(
      {required this.nameOrEmail,
        required this.username,
        required this.password});
}