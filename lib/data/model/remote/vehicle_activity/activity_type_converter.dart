import 'package:sayarti_mobile/domain/entity/remote/vehicle_activity/vehicle_activity_entity.dart';

ActivityType activityTypeFromJson(String value) => switch (value) {
  'FUEL' => ActivityType.fuel,
  'MAINTENANCE' => ActivityType.maintenance,
  'EXPENSE' => ActivityType.expense,
  'REMINDER' => ActivityType.reminder,
  _ => throw FormatException('Unknown activity type: $value'),
};

String activityTypeToJson(ActivityType value) => switch (value) {
  ActivityType.fuel => 'FUEL',
  ActivityType.maintenance => 'MAINTENANCE',
  ActivityType.expense => 'EXPENSE',
  ActivityType.reminder => 'REMINDER',
};
