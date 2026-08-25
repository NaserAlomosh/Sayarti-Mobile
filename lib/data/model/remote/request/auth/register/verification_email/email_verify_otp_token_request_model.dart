import 'package:json_annotation/json_annotation.dart';

part 'email_verify_otp_token_request_model.g.dart';

@JsonSerializable()
class EmailVerifyOtpTokenRequestModel {
  const EmailVerifyOtpTokenRequestModel({
    required this.tokenType,
    required this.otpCode,
  });

  factory EmailVerifyOtpTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EmailVerifyOtpTokenRequestModelFromJson(json);

  @JsonKey(name: 'tokenType')
  final String tokenType;

  @JsonKey(name: 'otpCode')
  final String otpCode;

  Map<String, dynamic> toJson() => _$EmailVerifyOtpTokenRequestModelToJson(this);
}
