import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/delete_maintenance_record_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/maintenance/maintenance_repository.dart';

@lazySingleton
class DeleteMaintenanceRecordUseCase extends BaseRemoteUsecase<
    DeleteMaintenanceRecordEntity, DeleteMaintenanceRecordUseCaseParams> {
  const DeleteMaintenanceRecordUseCase(this._repository);

  final MaintenanceRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<DeleteMaintenanceRecordEntity>>> call(
    DeleteMaintenanceRecordUseCaseParams params,
  ) => _repository.deleteMaintenanceRecord(params);
}

class DeleteMaintenanceRecordUseCaseParams extends BaseUsecaseParams {
  const DeleteMaintenanceRecordUseCaseParams({
    required this.vehicleId,
    required this.maintenanceRecordId,
  });

  final String vehicleId;
  final String maintenanceRecordId;
}
