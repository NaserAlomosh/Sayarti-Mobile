import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/delete_vehicle_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/vehicle/vehicle_repository.dart';
@lazySingleton
class DeleteVehicleUseCase extends BaseRemoteUsecase<DeleteVehicleEntity, DeleteVehicleUseCaseParams> {
 const DeleteVehicleUseCase(this._repository); final VehicleRepository _repository;
 @override Future<ApiResult<BaseResponseEntity<DeleteVehicleEntity>>> call(DeleteVehicleUseCaseParams params) => _repository.deleteVehicle(params);
}
class DeleteVehicleUseCaseParams extends BaseUsecaseParams { const DeleteVehicleUseCaseParams({required this.vehicleId}); final String vehicleId; }
