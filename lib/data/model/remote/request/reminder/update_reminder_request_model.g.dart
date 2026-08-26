// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_reminder_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReminderRequestModel _$UpdateReminderRequestModelFromJson(
  Map<String, dynamic> json,
) => UpdateReminderRequestModel(
  category: reminderCategoryNullableFromJson(json['category'] as String?),
  title: json['title'] as String?,
  description: json['description'] as String?,
  triggerType: reminderTriggerTypeNullableFromJson(
    json['triggerType'] as String?,
  ),
  targetDate: json['targetDate'] == null
      ? null
      : DateTime.parse(json['targetDate'] as String),
  targetMileage: (json['targetMileage'] as num?)?.toInt(),
);

Map<String, dynamic> _$UpdateReminderRequestModelToJson(
  UpdateReminderRequestModel instance,
) => <String, dynamic>{
  'category': ?reminderCategoryNullableToJson(instance.category),
  'title': ?instance.title,
  'description': ?instance.description,
  'triggerType': ?reminderTriggerTypeNullableToJson(instance.triggerType),
  'targetDate': ?instance.targetDate?.toIso8601String(),
  'targetMileage': ?instance.targetMileage,
};
