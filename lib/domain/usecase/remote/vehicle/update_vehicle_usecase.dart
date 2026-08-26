import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/vehicle/vehicle_repository.dart';
@lazySingleton
class UpdateVehicleUseCase extends BaseRemoteUsecase<VehicleEntity, UpdateVehicleUseCaseParams> {
 const UpdateVehicleUseCase(this._repository); final VehicleRepository _repository;
 @override Future<ApiResult<BaseResponseEntity<VehicleEntity>>> call(UpdateVehicleUseCaseParams params) => _repository.updateVehicle(params);
}
class UpdateVehicleUseCaseParams extends BaseUsecaseParams {
 const UpdateVehicleUseCaseParams({required this.vehicleId, this.brand, this.model, this.year, this.powertrainType, this.licensePlate, this.nickname, this.imageUrl, this.fuelType, this.fuelTankCapacityLiters, this.batteryCapacityKwh, this.estimatedRangeKm});
 final String vehicleId; final String? brand; final String? model; final int? year; final PowertrainType? powertrainType;
 final String? licensePlate; final String? nickname; final String? imageUrl; final FuelType? fuelType;
 final double? fuelTankCapacityLiters; final double? batteryCapacityKwh; final double? estimatedRangeKm;
}
