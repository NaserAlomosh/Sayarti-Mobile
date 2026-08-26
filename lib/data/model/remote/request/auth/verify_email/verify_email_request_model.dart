import 'package:json_annotation/json_annotation.dart';

part 'verify_email_request_model.g.dart';

@JsonSerializable()
class VerifyEmailRequestModel {
  const VerifyEmailRequestModel({required this.email, required this.otp});

  final String email;
  final String otp;

  factory VerifyEmailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEmailRequestModelToJson(this);
}
