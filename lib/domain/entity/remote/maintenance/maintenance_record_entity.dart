enum MaintenanceCategory {
  oilChange,
  filterChange,
  tireService,
  brakeService,
  battery,
  engine,
  transmission,
  coolingSystem,
  electrical,
  suspension,
  airConditioning,
  inspection,
  generalService,
  other,
}

class MaintenanceRecordEntity {
  const MaintenanceRecordEntity({
    required this.id,
    required this.vehicleId,
    required this.category,
    required this.title,
    required this.serviceDate,
    required this.mileageKm,
    required this.cost,
    required this.currencyCode,
    required this.serviceProvider,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String vehicleId;
  final MaintenanceCategory category;
  final String title;
  final DateTime serviceDate;
  final double mileageKm;
  final double cost;
  final String currencyCode;
  final String? serviceProvider;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
}
