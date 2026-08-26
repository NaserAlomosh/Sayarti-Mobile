import 'package:sayarti_mobile/domain/entity/remote/reminder/reminder_entity.dart';

ReminderCategory reminderCategoryFromJson(String value) => switch (value) {
  'LICENSE_EXPIRATION' => ReminderCategory.licenseExpiration,
  'INSURANCE_EXPIRATION' => ReminderCategory.insuranceExpiration,
  'MAINTENANCE' => ReminderCategory.maintenance,
  'OIL_CHANGE' => ReminderCategory.oilChange,
  'TIRE_SERVICE' => ReminderCategory.tireService,
  'REGISTRATION' => ReminderCategory.registration,
  'CUSTOM' => ReminderCategory.custom,
  _ => throw FormatException('Unknown reminder category: $value'),
};

ReminderCategory? reminderCategoryNullableFromJson(String? value) =>
    value == null ? null : reminderCategoryFromJson(value);

String reminderCategoryToJson(ReminderCategory value) => switch (value) {
  ReminderCategory.licenseExpiration => 'LICENSE_EXPIRATION',
  ReminderCategory.insuranceExpiration => 'INSURANCE_EXPIRATION',
  ReminderCategory.maintenance => 'MAINTENANCE',
  ReminderCategory.oilChange => 'OIL_CHANGE',
  ReminderCategory.tireService => 'TIRE_SERVICE',
  ReminderCategory.registration => 'REGISTRATION',
  ReminderCategory.custom => 'CUSTOM',
};

String? reminderCategoryNullableToJson(ReminderCategory? value) =>
    value == null ? null : reminderCategoryToJson(value);

ReminderTriggerType reminderTriggerTypeFromJson(String value) => switch (value) {
  'DATE' => ReminderTriggerType.date,
  'MILEAGE' => ReminderTriggerType.mileage,
  _ => throw FormatException('Unknown reminder trigger type: $value'),
};

ReminderTriggerType? reminderTriggerTypeNullableFromJson(String? value) =>
    value == null ? null : reminderTriggerTypeFromJson(value);

String reminderTriggerTypeToJson(ReminderTriggerType value) => switch (value) {
  ReminderTriggerType.date => 'DATE',
  ReminderTriggerType.mileage => 'MILEAGE',
};

String? reminderTriggerTypeNullableToJson(ReminderTriggerType? value) =>
    value == null ? null : reminderTriggerTypeToJson(value);
