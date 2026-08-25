class LoginRequestModel {
  const LoginRequestModel({required this.email, required this.password});

  final String email;
  final String password;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(email: json['email'] as String, password: json['password'] as String);

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
