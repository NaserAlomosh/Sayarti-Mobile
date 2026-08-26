import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/maintenance/maintenance_repository.dart';

@lazySingleton
class GetMaintenanceRecordsUseCase extends BaseRemoteUsecase<
    PaginatedEntity<MaintenanceRecordEntity>,
    GetMaintenanceRecordsUseCaseParams> {
  const GetMaintenanceRecordsUseCase(this._repository);

  final MaintenanceRepository _repository;

  @override
  Future<
    ApiResult<BaseResponseEntity<PaginatedEntity<MaintenanceRecordEntity>>>
  >
  call(GetMaintenanceRecordsUseCaseParams params) =>
      _repository.getMaintenanceRecords(params);
}

class GetMaintenanceRecordsUseCaseParams extends BaseUsecaseParams {
  const GetMaintenanceRecordsUseCaseParams({
    required this.vehicleId,
    this.page = 0,
    this.size = 20,
    this.sortBy,
    this.sortDirection,
    this.from,
    this.to,
  });

  final String vehicleId;
  final int page;
  final int size;
  final String? sortBy;
  final String? sortDirection;
  final DateTime? from;
  final DateTime? to;
}
