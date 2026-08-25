// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_mobile_otp_token_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyMobileOtpTokenRequestModel _$VerifyMobileOtpTokenRequestModelFromJson(
  Map<String, dynamic> json,
) => VerifyMobileOtpTokenRequestModel(
  tokenType: json['tokenType'] as String,
  otpCode: json['otpCode'] as String,
);

Map<String, dynamic> _$VerifyMobileOtpTokenRequestModelToJson(
  VerifyMobileOtpTokenRequestModel instance,
) => <String, dynamic>{
  'tokenType': instance.tokenType,
  'otpCode': instance.otpCode,
};
