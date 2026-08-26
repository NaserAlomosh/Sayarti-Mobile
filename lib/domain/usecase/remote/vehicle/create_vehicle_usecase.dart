import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/vehicle/vehicle_repository.dart';

@lazySingleton
class CreateVehicleUseCase extends BaseRemoteUsecase<VehicleEntity, CreateVehicleUseCaseParams> {
  const CreateVehicleUseCase(this._repository);
  final VehicleRepository _repository;
  @override
  Future<ApiResult<BaseResponseEntity<VehicleEntity>>> call(CreateVehicleUseCaseParams params) => _repository.createVehicle(params);
}

class CreateVehicleUseCaseParams extends BaseUsecaseParams {
  const CreateVehicleUseCaseParams({required this.brand, required this.model, required this.year, required this.powertrainType, required this.currentMileage, this.licensePlate, this.nickname, this.imageUrl, this.fuelType, this.fuelTankCapacityLiters, this.batteryCapacityKwh, this.estimatedRangeKm});
  final String brand; final String model; final int year; final PowertrainType powertrainType; final int currentMileage;
  final String? licensePlate; final String? nickname; final String? imageUrl; final FuelType? fuelType;
  final double? fuelTankCapacityLiters; final double? batteryCapacityKwh; final double? estimatedRangeKm;
}
