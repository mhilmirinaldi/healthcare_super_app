class RegisterParam{
  final String email;
  final String password;
  final String name;
  final String? photoUrl;

  RegisterParam({required this.email, required this.password, required this.name, this.photoUrl});
}