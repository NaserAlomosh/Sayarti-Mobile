import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/model/remote/request/maintenance/create_maintenance_record_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/maintenance/update_maintenance_record_request_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/delete_maintenance_record_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/maintenance/maintenance_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/create_maintenance_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/delete_maintenance_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/get_maintenance_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/get_maintenance_records_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/update_maintenance_record_usecase.dart';

@LazySingleton(as: MaintenanceRepository)
class MaintenanceRepositoryImpl implements MaintenanceRepository {
  const MaintenanceRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResult<BaseResponseEntity<MaintenanceRecordEntity>>>
  createMaintenanceRecord(CreateMaintenanceRecordUseCaseParams params) =>
      SafeRequest.execute<MaintenanceRecordEntity>(
        request: _apiService.createMaintenanceRecord(
          params.vehicleId,
          CreateMaintenanceRecordRequestModel(
            category: params.category,
            title: params.title,
            serviceDate: params.serviceDate,
            mileageKm: params.mileageKm,
            cost: params.cost,
            currencyCode: params.currencyCode,
            serviceProvider: params.serviceProvider,
            notes: params.notes,
          ),
        ),
      );

  @override
  Future<
    ApiResult<BaseResponseEntity<PaginatedEntity<MaintenanceRecordEntity>>>
  >
  getMaintenanceRecords(GetMaintenanceRecordsUseCaseParams params) =>
      SafeRequest.execute<PaginatedEntity<MaintenanceRecordEntity>>(
        request: _apiService.getMaintenanceRecords(
          params.vehicleId,
          params.page,
          params.size,
          params.sortBy,
          params.sortDirection,
          params.from,
          params.to,
        ),
      );

  @override
  Future<ApiResult<BaseResponseEntity<MaintenanceRecordEntity>>>
  getMaintenanceRecord(GetMaintenanceRecordUseCaseParams params) =>
      SafeRequest.execute<MaintenanceRecordEntity>(
        request: _apiService.getMaintenanceRecord(
          params.vehicleId,
          params.maintenanceRecordId,
        ),
      );

  @override
  Future<ApiResult<BaseResponseEntity<MaintenanceRecordEntity>>>
  updateMaintenanceRecord(UpdateMaintenanceRecordUseCaseParams params) =>
      SafeRequest.execute<MaintenanceRecordEntity>(
        request: _apiService.updateMaintenanceRecord(
          params.vehicleId,
          params.maintenanceRecordId,
          UpdateMaintenanceRecordRequestModel(
            category: params.category,
            title: params.title,
            serviceDate: params.serviceDate,
            mileageKm: params.mileageKm,
            cost: params.cost,
            currencyCode: params.currencyCode,
            serviceProvider: params.serviceProvider,
            notes: params.notes,
          ),
        ),
      );

  @override
  Future<ApiResult<BaseResponseEntity<DeleteMaintenanceRecordEntity>>>
  deleteMaintenanceRecord(DeleteMaintenanceRecordUseCaseParams params) =>
      SafeRequest.execute<DeleteMaintenanceRecordEntity>(
        request: _apiService.deleteMaintenanceRecord(
          params.vehicleId,
          params.maintenanceRecordId,
        ),
      );
}
