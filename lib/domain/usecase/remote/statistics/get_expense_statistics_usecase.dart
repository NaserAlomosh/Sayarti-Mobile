import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/expense_statistics_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/statistics/statistics_repository.dart';
@lazySingleton
class GetExpenseStatisticsUseCase extends BaseRemoteUsecase<ExpenseStatisticsEntity, GetExpenseStatisticsUseCaseParams> {
 const GetExpenseStatisticsUseCase(this._repository); final StatisticsRepository _repository;
 @override Future<ApiResult<BaseResponseEntity<ExpenseStatisticsEntity>>> call(GetExpenseStatisticsUseCaseParams params) => _repository.getExpenseStatistics(params);
}
class GetExpenseStatisticsUseCaseParams extends BaseUsecaseParams { const GetExpenseStatisticsUseCaseParams({required this.vehicleId}); final String vehicleId; }
