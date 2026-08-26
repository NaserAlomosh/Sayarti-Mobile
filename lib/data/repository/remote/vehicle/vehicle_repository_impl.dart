import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/model/remote/request/vehicle/create_vehicle_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/vehicle/update_mileage_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/vehicle/update_vehicle_request_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/delete_vehicle_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/vehicle/vehicle_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/create_vehicle_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/delete_vehicle_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/get_vehicle_details_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/get_vehicles_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/update_vehicle_mileage_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/update_vehicle_usecase.dart';

@LazySingleton(as: VehicleRepository)
class VehicleRepositoryImpl implements VehicleRepository {
  const VehicleRepositoryImpl(this._apiService);
  final ApiService _apiService;

  @override
  Future<ApiResult<BaseResponseEntity<VehicleEntity>>> createVehicle(CreateVehicleUseCaseParams params) => SafeRequest.execute<VehicleEntity>(request: _apiService.createVehicle(CreateVehicleRequestModel(brand: params.brand, model: params.model, year: params.year, powertrainType: params.powertrainType, currentMileage: params.currentMileage, licensePlate: params.licensePlate, nickname: params.nickname, imageUrl: params.imageUrl, fuelType: params.fuelType, fuelTankCapacityLiters: params.fuelTankCapacityLiters, batteryCapacityKwh: params.batteryCapacityKwh, estimatedRangeKm: params.estimatedRangeKm)));

  @override
  Future<ApiResult<BaseResponseEntity<PaginatedEntity<VehicleEntity>>>> getVehicles(GetVehiclesUseCaseParams params) => SafeRequest.execute<PaginatedEntity<VehicleEntity>>(request: _apiService.getVehicles(params.page, params.size, params.sortBy, params.sortDirection));

  @override
  Future<ApiResult<BaseResponseEntity<VehicleEntity>>> getVehicleDetails(GetVehicleDetailsUseCaseParams params) => SafeRequest.execute<VehicleEntity>(request: _apiService.getVehicleDetails(params.vehicleId));

  @override
  Future<ApiResult<BaseResponseEntity<VehicleEntity>>> updateVehicle(UpdateVehicleUseCaseParams params) => SafeRequest.execute<VehicleEntity>(request: _apiService.updateVehicle(params.vehicleId, UpdateVehicleRequestModel(brand: params.brand, model: params.model, year: params.year, powertrainType: params.powertrainType, licensePlate: params.licensePlate, nickname: params.nickname, imageUrl: params.imageUrl, fuelType: params.fuelType, fuelTankCapacityLiters: params.fuelTankCapacityLiters, batteryCapacityKwh: params.batteryCapacityKwh, estimatedRangeKm: params.estimatedRangeKm)));

  @override
  Future<ApiResult<BaseResponseEntity<VehicleEntity>>> updateVehicleMileage(UpdateVehicleMileageUseCaseParams params) => SafeRequest.execute<VehicleEntity>(request: _apiService.updateVehicleMileage(params.vehicleId, UpdateMileageRequestModel(mileage: params.mileage)));

  @override
  Future<ApiResult<BaseResponseEntity<DeleteVehicleEntity>>> deleteVehicle(DeleteVehicleUseCaseParams params) => SafeRequest.execute<DeleteVehicleEntity>(request: _apiService.deleteVehicle(params.vehicleId));
}
