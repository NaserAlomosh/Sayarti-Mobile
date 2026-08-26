import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/expense/expense_repository.dart';

@lazySingleton
class UpdateExpenseUseCase
    extends BaseRemoteUsecase<ExpenseEntity, UpdateExpenseUseCaseParams> {
  const UpdateExpenseUseCase(this._repository);

  final ExpenseRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<ExpenseEntity>>> call(
    UpdateExpenseUseCaseParams params,
  ) => _repository.updateExpense(params);
}

class UpdateExpenseUseCaseParams extends BaseUsecaseParams {
  const UpdateExpenseUseCaseParams({
    required this.vehicleId,
    required this.expenseId,
    this.category,
    this.title,
    this.expenseDate,
    this.amount,
    this.currencyCode,
    this.notes,
  });

  final String vehicleId;
  final String expenseId;
  final ExpenseCategory? category;
  final String? title;
  final DateTime? expenseDate;
  final double? amount;
  final String? currencyCode;
  final String? notes;
}
