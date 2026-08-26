import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/maintenance/maintenance_repository.dart';

@lazySingleton
class UpdateMaintenanceRecordUseCase extends BaseRemoteUsecase<
    MaintenanceRecordEntity, UpdateMaintenanceRecordUseCaseParams> {
  const UpdateMaintenanceRecordUseCase(this._repository);

  final MaintenanceRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<MaintenanceRecordEntity>>> call(
    UpdateMaintenanceRecordUseCaseParams params,
  ) => _repository.updateMaintenanceRecord(params);
}

class UpdateMaintenanceRecordUseCaseParams extends BaseUsecaseParams {
  const UpdateMaintenanceRecordUseCaseParams({
    required this.vehicleId,
    required this.maintenanceRecordId,
    this.category,
    this.title,
    this.serviceDate,
    this.mileageKm,
    this.cost,
    this.currencyCode,
    this.serviceProvider,
    this.notes,
  });

  final String vehicleId;
  final String maintenanceRecordId;
  final MaintenanceCategory? category;
  final String? title;
  final DateTime? serviceDate;
  final double? mileageKm;
  final double? cost;
  final String? currencyCode;
  final String? serviceProvider;
  final String? notes;
}
