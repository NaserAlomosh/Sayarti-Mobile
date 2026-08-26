// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_reminder_request_model.dart';

UpdateReminderRequestModel _$UpdateReminderRequestModelFromJson(Map<String, dynamic> json) => UpdateReminderRequestModel(category: reminderCategoryNullableFromJson(json['category'] as String?), title: json['title'] as String?, description: json['description'] as String?, triggerType: reminderTriggerTypeNullableFromJson(json['triggerType'] as String?), targetDate: json['targetDate'] == null ? null : DateTime.parse(json['targetDate'] as String), targetMileage: (json['targetMileage'] as num?)?.toInt());
Map<String, dynamic> _$UpdateReminderRequestModelToJson(UpdateReminderRequestModel instance) => <String, dynamic>{if (instance.category case final value?) 'category': reminderCategoryNullableToJson(value), if (instance.title case final value?) 'title': value, if (instance.description case final value?) 'description': value, if (instance.triggerType case final value?) 'triggerType': reminderTriggerTypeNullableToJson(value), if (instance.targetDate case final value?) 'targetDate': value.toIso8601String(), if (instance.targetMileage case final value?) 'targetMileage': value};
