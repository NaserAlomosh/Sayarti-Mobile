import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/expense_statistics_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/fuel_statistics_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/general_statistics_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/maintenance_statistics_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/true_vehicle_cost_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/statistics/statistics_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_expense_statistics_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_fuel_statistics_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_general_statistics_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_maintenance_statistics_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_true_vehicle_cost_usecase.dart';
@LazySingleton(as: StatisticsRepository)
class StatisticsRepositoryImpl implements StatisticsRepository {
 const StatisticsRepositoryImpl(this._apiService); final ApiService _apiService;
 @override Future<ApiResult<BaseResponseEntity<GeneralStatisticsEntity>>> getGeneralStatistics(GetGeneralStatisticsUseCaseParams params)=>SafeRequest.execute<GeneralStatisticsEntity>(request:_apiService.getGeneralStatistics(params.vehicleId));
 @override Future<ApiResult<BaseResponseEntity<FuelStatisticsEntity>>> getFuelStatistics(GetFuelStatisticsUseCaseParams params)=>SafeRequest.execute<FuelStatisticsEntity>(request:_apiService.getFuelStatistics(params.vehicleId));
 @override Future<ApiResult<BaseResponseEntity<MaintenanceStatisticsEntity>>> getMaintenanceStatistics(GetMaintenanceStatisticsUseCaseParams params)=>SafeRequest.execute<MaintenanceStatisticsEntity>(request:_apiService.getMaintenanceStatistics(params.vehicleId));
 @override Future<ApiResult<BaseResponseEntity<ExpenseStatisticsEntity>>> getExpenseStatistics(GetExpenseStatisticsUseCaseParams params)=>SafeRequest.execute<ExpenseStatisticsEntity>(request:_apiService.getExpenseStatistics(params.vehicleId));
 @override Future<ApiResult<BaseResponseEntity<TrueVehicleCostEntity>>> getTrueVehicleCost(GetTrueVehicleCostUseCaseParams params)=>SafeRequest.execute<TrueVehicleCostEntity>(request:_apiService.getTrueVehicleCost(params.vehicleId));
}
