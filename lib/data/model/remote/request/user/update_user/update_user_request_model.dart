import 'package:json_annotation/json_annotation.dart';

part 'update_user_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateUserRequestModel {
  const UpdateUserRequestModel({
    this.firstName,
    this.lastName,
    this.preferredLanguage,
  });

  final String? firstName;
  final String? lastName;
  final String? preferredLanguage;

  factory UpdateUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserRequestModelToJson(this);
}
