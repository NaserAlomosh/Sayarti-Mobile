import 'package:json_annotation/json_annotation.dart';

part 'send_mobile_otp_request_model.g.dart';

@JsonSerializable()
class SendMobileOtpRequestModel {
  const SendMobileOtpRequestModel({required this.tokenType});

  factory SendMobileOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendMobileOtpRequestModelFromJson(json);

  @JsonKey(name: 'tokenType')
  final String tokenType;

  Map<String, dynamic> toJson() => _$SendMobileOtpRequestModelToJson(this);
}
