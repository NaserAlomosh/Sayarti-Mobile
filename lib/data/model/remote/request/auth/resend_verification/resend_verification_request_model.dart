import 'package:json_annotation/json_annotation.dart';

part 'resend_verification_request_model.g.dart';

@JsonSerializable()
class ResendVerificationRequestModel {
  const ResendVerificationRequestModel({required this.email});
  final String email;

  factory ResendVerificationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResendVerificationRequestModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ResendVerificationRequestModelToJson(this);
}
