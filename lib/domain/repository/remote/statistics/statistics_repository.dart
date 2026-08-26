import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/expense_statistics_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/fuel_statistics_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/general_statistics_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/maintenance_statistics_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/true_vehicle_cost_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_expense_statistics_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_fuel_statistics_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_general_statistics_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_maintenance_statistics_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/statistics/get_true_vehicle_cost_usecase.dart';
abstract class StatisticsRepository {
 Future<ApiResult<BaseResponseEntity<GeneralStatisticsEntity>>> getGeneralStatistics(GetGeneralStatisticsUseCaseParams params);
 Future<ApiResult<BaseResponseEntity<FuelStatisticsEntity>>> getFuelStatistics(GetFuelStatisticsUseCaseParams params);
 Future<ApiResult<BaseResponseEntity<MaintenanceStatisticsEntity>>> getMaintenanceStatistics(GetMaintenanceStatisticsUseCaseParams params);
 Future<ApiResult<BaseResponseEntity<ExpenseStatisticsEntity>>> getExpenseStatistics(GetExpenseStatisticsUseCaseParams params);
 Future<ApiResult<BaseResponseEntity<TrueVehicleCostEntity>>> getTrueVehicleCost(GetTrueVehicleCostUseCaseParams params);
}
