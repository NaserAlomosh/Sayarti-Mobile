import 'package:sayarti_mobile/domain/entity/remote/statistics/currency_statistics_entity.dart';
class FuelStatisticsEntity {
  const FuelStatisticsEntity({required this.vehicleId, required this.totalFuelRecords, required this.totalFuelQuantity, required this.totalFuelCostByCurrency, required this.totalDistanceKm, required this.averageFuelEfficiencyKmPerLiter, required this.averageFuelConsumptionLitersPer100Km, required this.averageFuelCostPerKmByCurrency});
  final String vehicleId; final int totalFuelRecords; final double totalFuelQuantity; final List<CurrencyTotalEntity> totalFuelCostByCurrency; final double totalDistanceKm; final double? averageFuelEfficiencyKmPerLiter; final double? averageFuelConsumptionLitersPer100Km; final List<CurrencyRateEntity> averageFuelCostPerKmByCurrency;
}
