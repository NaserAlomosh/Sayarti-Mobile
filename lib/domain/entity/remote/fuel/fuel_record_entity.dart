class FuelRecordEntity {
  const FuelRecordEntity({required this.id, required this.vehicleId, required this.odometerKm, required this.quantityLiters, required this.pricePerLiter, required this.totalCost, required this.currencyCode, required this.filledAt, required this.fullTank, required this.stationName, required this.notes, required this.createdAt, required this.updatedAt});

  final String id;
  final String vehicleId;
  final double odometerKm;
  final double quantityLiters;
  final double pricePerLiter;
  final double totalCost;
  final String currencyCode;
  final DateTime filledAt;
  final bool fullTank;
  final String? stationName;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
}
