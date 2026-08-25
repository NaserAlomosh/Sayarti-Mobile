import 'package:json_annotation/json_annotation.dart';

part 'selfie_check_request_model.g.dart';

@JsonSerializable()
class SelfieCheckRequestModel {
  const SelfieCheckRequestModel({required this.identityValidationRefNo});

  factory SelfieCheckRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SelfieCheckRequestModelFromJson(json);

  @JsonKey(name: 'identityValidationRefNo')
  final String identityValidationRefNo;

  Map<String, dynamic> toJson() => _$SelfieCheckRequestModelToJson(this);
}
