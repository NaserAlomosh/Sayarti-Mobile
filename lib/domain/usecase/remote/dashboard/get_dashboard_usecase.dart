import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/dashboard/dashboard_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/dashboard/dashboard_repository.dart';

@lazySingleton
class GetDashboardUseCase
    extends BaseRemoteUsecase<DashboardEntity, GetDashboardUseCaseParams> {
  const GetDashboardUseCase(this._repository);

  final DashboardRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<DashboardEntity>>> call(
    GetDashboardUseCaseParams params,
  ) => _repository.getDashboard(params);
}

class GetDashboardUseCaseParams extends BaseUsecaseParams {
  const GetDashboardUseCaseParams({required this.vehicleId});

  final String vehicleId;
}
