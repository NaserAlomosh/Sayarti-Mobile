import 'package:json_annotation/json_annotation.dart';

part 'register_new_user_request_model.g.dart';

@JsonSerializable()
class RegisterNewUserRequestModel {
  const RegisterNewUserRequestModel({
    required this.mobileNumber,
    required this.email,
    required this.userName,
    required this.newPassword,
    required this.reEnterPassword,
  });

  factory RegisterNewUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterNewUserRequestModelFromJson(json);

  @JsonKey(name: 'mobileNumber')
  final String mobileNumber;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'userName')
  final String userName;

  @JsonKey(name: 'newPassword')
  final String newPassword;

  @JsonKey(name: 'ReEnterPassword')
  final String reEnterPassword;

  Map<String, dynamic> toJson() => _$RegisterNewUserRequestModelToJson(this);
}
