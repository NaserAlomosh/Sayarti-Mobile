import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/logout_entity.dart';

part 'logout_model.g.dart';

@JsonSerializable()
class LogoutModel extends BaseTransformResponseModel<LogoutEntity> {
  const LogoutModel({required this.revoked});
  final bool revoked;

  factory LogoutModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutModelFromJson(json);
  Map<String, dynamic> toJson() => _$LogoutModelToJson(this);

  @override
  LogoutEntity toEntity() => LogoutEntity(revoked: revoked);
}
