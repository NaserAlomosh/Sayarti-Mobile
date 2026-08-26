import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/delete_expense_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/expense/expense_repository.dart';

@lazySingleton
class DeleteExpenseUseCase extends BaseRemoteUsecase<
    DeleteExpenseEntity, DeleteExpenseUseCaseParams> {
  const DeleteExpenseUseCase(this._repository);

  final ExpenseRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<DeleteExpenseEntity>>> call(
    DeleteExpenseUseCaseParams params,
  ) => _repository.deleteExpense(params);
}

class DeleteExpenseUseCaseParams extends BaseUsecaseParams {
  const DeleteExpenseUseCaseParams({
    required this.vehicleId,
    required this.expenseId,
  });

  final String vehicleId;
  final String expenseId;
}
