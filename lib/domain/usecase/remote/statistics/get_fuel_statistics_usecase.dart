import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/fuel_statistics_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/statistics/statistics_repository.dart';
@lazySingleton
class GetFuelStatisticsUseCase extends BaseRemoteUsecase<FuelStatisticsEntity, GetFuelStatisticsUseCaseParams> {
 const GetFuelStatisticsUseCase(this._repository); final StatisticsRepository _repository;
 @override Future<ApiResult<BaseResponseEntity<FuelStatisticsEntity>>> call(GetFuelStatisticsUseCaseParams params) => _repository.getFuelStatistics(params);
}
class GetFuelStatisticsUseCaseParams extends BaseUsecaseParams { const GetFuelStatisticsUseCaseParams({required this.vehicleId}); final String vehicleId; }
