import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';
@JsonSerializable()
class LoginRequestModel {
  const LoginRequestModel({
    required this.userName,
    required this.password,
    required this.loginType,
    this.cipher,
    this.appLoginPin,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  @JsonKey(name: 'userName')
  final String userName;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'loginType')
  final String loginType;

  @JsonKey(name: 'cipher')
  final String? cipher;

  @JsonKey(name: 'appLoginPin')
  final String? appLoginPin;

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
