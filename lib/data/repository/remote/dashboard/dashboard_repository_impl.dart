import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/dashboard/dashboard_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/dashboard/dashboard_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/dashboard/get_dashboard_usecase.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  const DashboardRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResult<BaseResponseEntity<DashboardEntity>>> getDashboard(
    GetDashboardUseCaseParams params,
  ) => SafeRequest.execute<DashboardEntity>(
    request: _apiService.getDashboard(params.vehicleId),
  );
}
