import 'package:json_annotation/json_annotation.dart';

part 'verify_mobile_otp_token_request_model.g.dart';

@JsonSerializable()
class VerifyMobileOtpTokenRequestModel {
  const VerifyMobileOtpTokenRequestModel({
    required this.tokenType,
    required this.otpCode,
  });

  factory VerifyMobileOtpTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyMobileOtpTokenRequestModelFromJson(json);

  @JsonKey(name: 'tokenType')
  final String tokenType;

  @JsonKey(name: 'otpCode')
  final String otpCode;

  Map<String, dynamic> toJson() => _$VerifyMobileOtpTokenRequestModelToJson(this);
}
