enum ReminderCategory {
  licenseExpiration,
  insuranceExpiration,
  maintenance,
  oilChange,
  tireService,
  registration,
  custom,
}

enum ReminderTriggerType { date, mileage }

class ReminderEntity {
  const ReminderEntity({
    required this.id,
    required this.vehicleId,
    required this.category,
    required this.title,
    required this.description,
    required this.triggerType,
    required this.targetDate,
    required this.targetMileage,
    required this.completed,
    required this.completedAt,
    required this.notificationDeliveredAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String vehicleId;
  final ReminderCategory category;
  final String title;
  final String? description;
  final ReminderTriggerType triggerType;
  final DateTime? targetDate;
  final int? targetMileage;
  final bool completed;
  final DateTime? completedAt;
  final DateTime? notificationDeliveredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
}
