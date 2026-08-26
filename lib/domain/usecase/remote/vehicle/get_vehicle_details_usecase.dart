import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/vehicle/vehicle_repository.dart';
@lazySingleton
class GetVehicleDetailsUseCase extends BaseRemoteUsecase<VehicleEntity, GetVehicleDetailsUseCaseParams> {
  const GetVehicleDetailsUseCase(this._repository); final VehicleRepository _repository;
  @override Future<ApiResult<BaseResponseEntity<VehicleEntity>>> call(GetVehicleDetailsUseCaseParams params) => _repository.getVehicleDetails(params);
}
class GetVehicleDetailsUseCaseParams extends BaseUsecaseParams { const GetVehicleDetailsUseCaseParams({required this.vehicleId}); final String vehicleId; }
