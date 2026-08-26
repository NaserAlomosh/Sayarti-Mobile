import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/model/remote/request/fuel/create_fuel_record_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/fuel/update_fuel_record_request_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/delete_fuel_record_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_record_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_summary_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/fuel/fuel_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/create_fuel_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/delete_fuel_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_record_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_records_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/get_fuel_summary_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/fuel/update_fuel_record_usecase.dart';

@LazySingleton(as: FuelRepository)
class FuelRepositoryImpl implements FuelRepository {
  const FuelRepositoryImpl(this._apiService); final ApiService _apiService;
  @override Future<ApiResult<BaseResponseEntity<FuelRecordEntity>>> createFuelRecord(CreateFuelRecordUseCaseParams params) => SafeRequest.execute<FuelRecordEntity>(request: _apiService.createFuelRecord(params.vehicleId, CreateFuelRecordRequestModel(odometerKm: params.odometerKm, quantityLiters: params.quantityLiters, pricePerLiter: params.pricePerLiter, currencyCode: params.currencyCode, filledAt: params.filledAt, fullTank: params.fullTank, stationName: params.stationName, notes: params.notes)));
  @override Future<ApiResult<BaseResponseEntity<PaginatedEntity<FuelRecordEntity>>>> getFuelRecords(GetFuelRecordsUseCaseParams params) => SafeRequest.execute<PaginatedEntity<FuelRecordEntity>>(request: _apiService.getFuelRecords(params.vehicleId, params.page, params.size, params.sortBy, params.sortDirection, params.from, params.to));
  @override Future<ApiResult<BaseResponseEntity<FuelRecordEntity>>> getFuelRecord(GetFuelRecordUseCaseParams params) => SafeRequest.execute<FuelRecordEntity>(request: _apiService.getFuelRecord(params.vehicleId, params.fuelRecordId));
  @override Future<ApiResult<BaseResponseEntity<FuelSummaryEntity>>> getFuelSummary(GetFuelSummaryUseCaseParams params) => SafeRequest.execute<FuelSummaryEntity>(request: _apiService.getFuelSummary(params.vehicleId, params.month));
  @override Future<ApiResult<BaseResponseEntity<FuelRecordEntity>>> updateFuelRecord(UpdateFuelRecordUseCaseParams params) => SafeRequest.execute<FuelRecordEntity>(request: _apiService.updateFuelRecord(params.vehicleId, params.fuelRecordId, UpdateFuelRecordRequestModel(quantityLiters: params.quantityLiters, pricePerLiter: params.pricePerLiter, currencyCode: params.currencyCode, filledAt: params.filledAt, fullTank: params.fullTank, stationName: params.stationName, notes: params.notes)));
  @override Future<ApiResult<BaseResponseEntity<DeleteFuelRecordEntity>>> deleteFuelRecord(DeleteFuelRecordUseCaseParams params) => SafeRequest.execute<DeleteFuelRecordEntity>(request: _apiService.deleteFuelRecord(params.vehicleId, params.fuelRecordId));
}
