import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/model/remote/reminder/reminder_enum_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/reminder_entity.dart';

part 'create_reminder_request_model.g.dart';

@JsonSerializable()
class CreateReminderRequestModel {
  const CreateReminderRequestModel({required this.category, required this.title, this.description, required this.triggerType, this.targetDate, this.targetMileage});
  @JsonKey(fromJson: reminderCategoryFromJson, toJson: reminderCategoryToJson)
  final ReminderCategory category;
  final String title;
  final String? description;
  @JsonKey(fromJson: reminderTriggerTypeFromJson, toJson: reminderTriggerTypeToJson)
  final ReminderTriggerType triggerType;
  final DateTime? targetDate;
  final int? targetMileage;
  factory CreateReminderRequestModel.fromJson(Map<String, dynamic> json) => _$CreateReminderRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateReminderRequestModelToJson(this);
}
