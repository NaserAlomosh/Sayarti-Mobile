import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/maintenance/maintenance_repository.dart';

@lazySingleton
class GetMaintenanceRecordUseCase extends BaseRemoteUsecase<
    MaintenanceRecordEntity, GetMaintenanceRecordUseCaseParams> {
  const GetMaintenanceRecordUseCase(this._repository);

  final MaintenanceRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<MaintenanceRecordEntity>>> call(
    GetMaintenanceRecordUseCaseParams params,
  ) => _repository.getMaintenanceRecord(params);
}

class GetMaintenanceRecordUseCaseParams extends BaseUsecaseParams {
  const GetMaintenanceRecordUseCaseParams({
    required this.vehicleId,
    required this.maintenanceRecordId,
  });

  final String vehicleId;
  final String maintenanceRecordId;
}
