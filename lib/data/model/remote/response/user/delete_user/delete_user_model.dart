import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/user/delete_user_entity.dart';

part 'delete_user_model.g.dart';

@JsonSerializable()
class DeleteUserModel extends BaseTransformResponseModel<DeleteUserEntity> {
  const DeleteUserModel({required this.deleted});

  final bool deleted;

  factory DeleteUserModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserModelToJson(this);

  @override
  DeleteUserEntity toEntity() => DeleteUserEntity(deleted: deleted);
}
