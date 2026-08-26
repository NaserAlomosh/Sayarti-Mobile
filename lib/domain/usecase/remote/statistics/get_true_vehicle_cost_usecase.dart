import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/true_vehicle_cost_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/statistics/statistics_repository.dart';
@lazySingleton
class GetTrueVehicleCostUseCase extends BaseRemoteUsecase<TrueVehicleCostEntity, GetTrueVehicleCostUseCaseParams> {
 const GetTrueVehicleCostUseCase(this._repository); final StatisticsRepository _repository;
 @override Future<ApiResult<BaseResponseEntity<TrueVehicleCostEntity>>> call(GetTrueVehicleCostUseCaseParams params) => _repository.getTrueVehicleCost(params);
}
class GetTrueVehicleCostUseCaseParams extends BaseUsecaseParams { const GetTrueVehicleCostUseCaseParams({required this.vehicleId}); final String vehicleId; }
