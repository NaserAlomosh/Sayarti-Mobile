// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verify_otp_token_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerifyOtpTokenRequestModel _$EmailVerifyOtpTokenRequestModelFromJson(
  Map<String, dynamic> json,
) => EmailVerifyOtpTokenRequestModel(
  tokenType: json['tokenType'] as String,
  otpCode: json['otpCode'] as String,
);

Map<String, dynamic> _$EmailVerifyOtpTokenRequestModelToJson(
  EmailVerifyOtpTokenRequestModel instance,
) => <String, dynamic>{
  'tokenType': instance.tokenType,
  'otpCode': instance.otpCode,
};
