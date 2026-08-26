import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/delete_maintenance_record_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/create_maintenance_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/delete_maintenance_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/get_maintenance_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/get_maintenance_records_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/maintenance/update_maintenance_record_usecase.dart';

abstract class MaintenanceRepository {
  Future<ApiResult<BaseResponseEntity<MaintenanceRecordEntity>>>
  createMaintenanceRecord(CreateMaintenanceRecordUseCaseParams params);

  Future<
    ApiResult<BaseResponseEntity<PaginatedEntity<MaintenanceRecordEntity>>>
  >
  getMaintenanceRecords(GetMaintenanceRecordsUseCaseParams params);

  Future<ApiResult<BaseResponseEntity<MaintenanceRecordEntity>>>
  getMaintenanceRecord(GetMaintenanceRecordUseCaseParams params);

  Future<ApiResult<BaseResponseEntity<MaintenanceRecordEntity>>>
  updateMaintenanceRecord(UpdateMaintenanceRecordUseCaseParams params);

  Future<ApiResult<BaseResponseEntity<DeleteMaintenanceRecordEntity>>>
  deleteMaintenanceRecord(DeleteMaintenanceRecordUseCaseParams params);
}
