import 'package:json_annotation/json_annotation.dart';

part 'create_app_pin_request_model.g.dart';

@JsonSerializable()
class CreateAppPinRequestModel {
  const CreateAppPinRequestModel({
    required this.appPin,
    required this.confirmAppPin,
  });

  factory CreateAppPinRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateAppPinRequestModelFromJson(json);

  @JsonKey(name: 'appPin')
  final String appPin;

  @JsonKey(name: 'ConfirmAppPin')
  final String confirmAppPin;

  Map<String, dynamic> toJson() => _$CreateAppPinRequestModelToJson(this);
}
