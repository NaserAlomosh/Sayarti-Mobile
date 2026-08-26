// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reminder_request_model.dart';

CreateReminderRequestModel _$CreateReminderRequestModelFromJson(Map<String, dynamic> json) => CreateReminderRequestModel(category: reminderCategoryFromJson(json['category'] as String), title: json['title'] as String, description: json['description'] as String?, triggerType: reminderTriggerTypeFromJson(json['triggerType'] as String), targetDate: json['targetDate'] == null ? null : DateTime.parse(json['targetDate'] as String), targetMileage: (json['targetMileage'] as num?)?.toInt());
Map<String, dynamic> _$CreateReminderRequestModelToJson(CreateReminderRequestModel instance) => <String, dynamic>{'category': reminderCategoryToJson(instance.category), 'title': instance.title, 'description': instance.description, 'triggerType': reminderTriggerTypeToJson(instance.triggerType), 'targetDate': instance.targetDate?.toIso8601String(), 'targetMileage': instance.targetMileage};
