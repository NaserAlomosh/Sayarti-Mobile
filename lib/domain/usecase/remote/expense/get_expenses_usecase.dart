import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/expense/expense_repository.dart';

@lazySingleton
class GetExpensesUseCase extends BaseRemoteUsecase<
    PaginatedEntity<ExpenseEntity>, GetExpensesUseCaseParams> {
  const GetExpensesUseCase(this._repository);

  final ExpenseRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<PaginatedEntity<ExpenseEntity>>>> call(
    GetExpensesUseCaseParams params,
  ) => _repository.getExpenses(params);
}

class GetExpensesUseCaseParams extends BaseUsecaseParams {
  const GetExpensesUseCaseParams({
    required this.vehicleId,
    this.page = 0,
    this.size = 20,
    this.sortBy,
    this.sortDirection,
    this.from,
    this.to,
  });

  final String vehicleId;
  final int page;
  final int size;
  final String? sortBy;
  final String? sortDirection;
  final DateTime? from;
  final DateTime? to;
}
