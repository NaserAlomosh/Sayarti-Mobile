import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/maintenance_statistics_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/statistics/statistics_repository.dart';
@lazySingleton
class GetMaintenanceStatisticsUseCase extends BaseRemoteUsecase<MaintenanceStatisticsEntity, GetMaintenanceStatisticsUseCaseParams> {
 const GetMaintenanceStatisticsUseCase(this._repository); final StatisticsRepository _repository;
 @override Future<ApiResult<BaseResponseEntity<MaintenanceStatisticsEntity>>> call(GetMaintenanceStatisticsUseCaseParams params) => _repository.getMaintenanceStatistics(params);
}
class GetMaintenanceStatisticsUseCaseParams extends BaseUsecaseParams { const GetMaintenanceStatisticsUseCaseParams({required this.vehicleId}); final String vehicleId; }
