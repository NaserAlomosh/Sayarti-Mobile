enum ActivityType { fuel, maintenance, expense, reminder }

class VehicleActivityEntity {
  const VehicleActivityEntity({
    required this.type,
    required this.referenceId,
    required this.vehicleId,
    required this.title,
    required this.occurredAt,
    required this.amount,
    required this.currencyCode,
  });

  final ActivityType type;
  final String referenceId;
  final String vehicleId;
  final String title;
  final DateTime occurredAt;
  final double? amount;
  final String? currencyCode;
}
