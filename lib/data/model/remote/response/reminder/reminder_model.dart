import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/reminder/reminder_enum_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/reminder_entity.dart';

part 'reminder_model.g.dart';

@JsonSerializable()
class ReminderModel extends BaseTransformResponseModel<ReminderEntity> {
  const ReminderModel({required this.id, required this.vehicleId, required this.category, required this.title, required this.description, required this.triggerType, required this.targetDate, required this.targetMileage, required this.completed, required this.completedAt, required this.notificationDeliveredAt, required this.createdAt, required this.updatedAt});
  final String id;
  final String vehicleId;
  @JsonKey(fromJson: reminderCategoryFromJson, toJson: reminderCategoryToJson)
  final ReminderCategory category;
  final String title;
  final String? description;
  @JsonKey(fromJson: reminderTriggerTypeFromJson, toJson: reminderTriggerTypeToJson)
  final ReminderTriggerType triggerType;
  final DateTime? targetDate;
  final int? targetMileage;
  final bool completed;
  final DateTime? completedAt;
  final DateTime? notificationDeliveredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  factory ReminderModel.fromJson(Map<String, dynamic> json) => _$ReminderModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReminderModelToJson(this);
  @override
  ReminderEntity toEntity() => ReminderEntity(id: id, vehicleId: vehicleId, category: category, title: title, description: description, triggerType: triggerType, targetDate: targetDate, targetMileage: targetMileage, completed: completed, completedAt: completedAt, notificationDeliveredAt: notificationDeliveredAt, createdAt: createdAt, updatedAt: updatedAt);
}
