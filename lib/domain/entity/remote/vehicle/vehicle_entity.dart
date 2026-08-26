enum PowertrainType { gasoline, diesel, hybrid, plugInHybrid, electric }

enum FuelType { gasoline90, gasoline95, gasoline98, diesel, other }

class VehicleEntity {
  const VehicleEntity({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.powertrainType,
    required this.currentMileage,
    required this.licensePlate,
    required this.nickname,
    required this.imageUrl,
    required this.fuelType,
    required this.fuelTankCapacityLiters,
    required this.batteryCapacityKwh,
    required this.estimatedRangeKm,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String brand;
  final String model;
  final int year;
  final PowertrainType powertrainType;
  final int currentMileage;
  final String? licensePlate;
  final String? nickname;
  final String? imageUrl;
  final FuelType? fuelType;
  final double? fuelTankCapacityLiters;
  final double? batteryCapacityKwh;
  final double? estimatedRangeKm;
  final DateTime createdAt;
  final DateTime updatedAt;
}
