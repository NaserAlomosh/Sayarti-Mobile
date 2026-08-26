import 'package:json_annotation/json_annotation.dart';

part 'update_fcm_token_request_model.g.dart';

@JsonSerializable()
class UpdateFcmTokenRequestModel {
  const UpdateFcmTokenRequestModel({required this.fcmToken});

  final String fcmToken;

  factory UpdateFcmTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateFcmTokenRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateFcmTokenRequestModelToJson(this);
}
