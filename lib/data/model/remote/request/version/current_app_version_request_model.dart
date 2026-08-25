import 'package:json_annotation/json_annotation.dart';

part 'current_app_version_request_model.g.dart';

@JsonSerializable()
class CurrentAppVersionRequestModel {
  CurrentAppVersionRequestModel({
    this.parentVersion,
    this.version,
    this.platform,
  });

  factory CurrentAppVersionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentAppVersionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentAppVersionRequestModelToJson(this);

  @JsonKey(name: 'parentVersion')
  final String? parentVersion;

  @JsonKey(name: 'version')
  final String? version;

  @JsonKey(name: 'platform')
  final String? platform;
}
