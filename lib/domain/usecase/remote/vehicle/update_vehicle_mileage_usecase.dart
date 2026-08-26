import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/vehicle/vehicle_repository.dart';
@lazySingleton
class UpdateVehicleMileageUseCase extends BaseRemoteUsecase<VehicleEntity, UpdateVehicleMileageUseCaseParams> {
 const UpdateVehicleMileageUseCase(this._repository); final VehicleRepository _repository;
 @override Future<ApiResult<BaseResponseEntity<VehicleEntity>>> call(UpdateVehicleMileageUseCaseParams params) => _repository.updateVehicleMileage(params);
}
class UpdateVehicleMileageUseCaseParams extends BaseUsecaseParams { const UpdateVehicleMileageUseCaseParams({required this.vehicleId, required this.mileage}); final String vehicleId; final int mileage; }
