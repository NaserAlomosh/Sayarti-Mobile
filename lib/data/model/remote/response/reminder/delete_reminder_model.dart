import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/delete_reminder_entity.dart';

part 'delete_reminder_model.g.dart';

@JsonSerializable()
class DeleteReminderModel extends BaseTransformResponseModel<DeleteReminderEntity> {
  const DeleteReminderModel({required this.deleted});
  final bool deleted;
  factory DeleteReminderModel.fromJson(Map<String, dynamic> json) => _$DeleteReminderModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteReminderModelToJson(this);
  @override
  DeleteReminderEntity toEntity() => DeleteReminderEntity(deleted: deleted);
}
