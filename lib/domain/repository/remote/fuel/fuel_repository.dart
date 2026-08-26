import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/delete_fuel_record_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_record_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_summary_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/create_fuel_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/delete_fuel_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_records_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_summary_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/update_fuel_record_usecase.dart';

abstract class FuelRepository {
  Future<ApiResult<BaseResponseEntity<FuelRecordEntity>>> createFuelRecord(CreateFuelRecordUseCaseParams params);
  Future<ApiResult<BaseResponseEntity<PaginatedEntity<FuelRecordEntity>>>> getFuelRecords(GetFuelRecordsUseCaseParams params);
  Future<ApiResult<BaseResponseEntity<FuelRecordEntity>>> getFuelRecord(GetFuelRecordUseCaseParams params);
  Future<ApiResult<BaseResponseEntity<FuelSummaryEntity>>> getFuelSummary(GetFuelSummaryUseCaseParams params);
  Future<ApiResult<BaseResponseEntity<FuelRecordEntity>>> updateFuelRecord(UpdateFuelRecordUseCaseParams params);
  Future<ApiResult<BaseResponseEntity<DeleteFuelRecordEntity>>> deleteFuelRecord(DeleteFuelRecordUseCaseParams params);
}
