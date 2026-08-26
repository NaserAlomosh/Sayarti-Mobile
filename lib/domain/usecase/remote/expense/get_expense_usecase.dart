import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/expense/expense_repository.dart';

@lazySingleton
class GetExpenseUseCase
    extends BaseRemoteUsecase<ExpenseEntity, GetExpenseUseCaseParams> {
  const GetExpenseUseCase(this._repository);

  final ExpenseRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<ExpenseEntity>>> call(
    GetExpenseUseCaseParams params,
  ) => _repository.getExpense(params);
}

class GetExpenseUseCaseParams extends BaseUsecaseParams {
  const GetExpenseUseCaseParams({
    required this.vehicleId,
    required this.expenseId,
  });

  final String vehicleId;
  final String expenseId;
}
