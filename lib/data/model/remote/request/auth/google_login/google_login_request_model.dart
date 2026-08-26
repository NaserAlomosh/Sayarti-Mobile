import 'package:json_annotation/json_annotation.dart';

part 'google_login_request_model.g.dart';

@JsonSerializable()
class GoogleLoginRequestModel {
  const GoogleLoginRequestModel({required this.idToken});
  final String idToken;

  factory GoogleLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$GoogleLoginRequestModelToJson(this);
}
