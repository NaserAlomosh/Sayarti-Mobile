import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/general_statistics_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/statistics/statistics_repository.dart';
@lazySingleton
class GetGeneralStatisticsUseCase extends BaseRemoteUsecase<GeneralStatisticsEntity, GetGeneralStatisticsUseCaseParams> {
 const GetGeneralStatisticsUseCase(this._repository); final StatisticsRepository _repository;
 @override Future<ApiResult<BaseResponseEntity<GeneralStatisticsEntity>>> call(GetGeneralStatisticsUseCaseParams params) => _repository.getGeneralStatistics(params);
}
class GetGeneralStatisticsUseCaseParams extends BaseUsecaseParams { const GetGeneralStatisticsUseCaseParams({required this.vehicleId}); final String vehicleId; }
