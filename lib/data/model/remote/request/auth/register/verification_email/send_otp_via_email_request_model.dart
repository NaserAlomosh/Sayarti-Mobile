import 'package:json_annotation/json_annotation.dart';

part 'send_otp_via_email_request_model.g.dart';

@JsonSerializable()
class SendOtpViaEmailRequestModel {
  const SendOtpViaEmailRequestModel({
    required this.tokenType,
  });

  factory SendOtpViaEmailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendOtpViaEmailRequestModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$SendOtpViaEmailRequestModelToJson(this);

  @JsonKey(name: 'tokenType')
  final String tokenType;

}
