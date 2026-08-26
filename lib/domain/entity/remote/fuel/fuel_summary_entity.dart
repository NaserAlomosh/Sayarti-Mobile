class FuelSummaryEntity {
  const FuelSummaryEntity({required this.vehicleId, required this.liquidFuelCalculationsSupported, required this.month, required this.totalFuelQuantity, required this.totalDistanceKm, required this.averageFuelEfficiencyKmPerLiter, required this.averageLitersPer100Km, required this.costsByCurrency});

  final String vehicleId;
  final bool liquidFuelCalculationsSupported;
  final String month;
  final double totalFuelQuantity;
  final double totalDistanceKm;
  final double? averageFuelEfficiencyKmPerLiter;
  final double? averageLitersPer100Km;
  final List<FuelCostSummaryEntity> costsByCurrency;
}

class FuelCostSummaryEntity {
  const FuelCostSummaryEntity({required this.currencyCode, required this.totalFuelCost, required this.monthlyFuelCost, required this.costPerKm});
  final String currencyCode;
  final double totalFuelCost;
  final double monthlyFuelCost;
  final double? costPerKm;
}
