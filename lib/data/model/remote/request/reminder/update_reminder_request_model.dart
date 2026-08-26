import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/model/remote/reminder/reminder_enum_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/reminder_entity.dart';

part 'update_reminder_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateReminderRequestModel {
  const UpdateReminderRequestModel({this.category, this.title, this.description, this.triggerType, this.targetDate, this.targetMileage});
  @JsonKey(fromJson: reminderCategoryNullableFromJson, toJson: reminderCategoryNullableToJson)
  final ReminderCategory? category;
  final String? title;
  final String? description;
  @JsonKey(fromJson: reminderTriggerTypeNullableFromJson, toJson: reminderTriggerTypeNullableToJson)
  final ReminderTriggerType? triggerType;
  final DateTime? targetDate;
  final int? targetMileage;
  factory UpdateReminderRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateReminderRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateReminderRequestModelToJson(this);
}
