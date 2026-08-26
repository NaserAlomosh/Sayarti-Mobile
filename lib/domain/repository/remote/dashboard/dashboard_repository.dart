import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/dashboard/dashboard_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/dashboard/get_dashboard_usecase.dart';

abstract class DashboardRepository {
  Future<ApiResult<BaseResponseEntity<DashboardEntity>>> getDashboard(
    GetDashboardUseCaseParams params,
  );
}
