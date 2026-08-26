import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/expense/expense_repository.dart';

@lazySingleton
class CreateExpenseUseCase
    extends BaseRemoteUsecase<ExpenseEntity, CreateExpenseUseCaseParams> {
  const CreateExpenseUseCase(this._repository);

  final ExpenseRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<ExpenseEntity>>> call(
    CreateExpenseUseCaseParams params,
  ) => _repository.createExpense(params);
}

class CreateExpenseUseCaseParams extends BaseUsecaseParams {
  const CreateExpenseUseCaseParams({
    required this.vehicleId,
    required this.category,
    required this.title,
    required this.expenseDate,
    required this.amount,
    this.currencyCode,
    this.notes,
  });

  final String vehicleId;
  final ExpenseCategory category;
  final String title;
  final DateTime expenseDate;
  final double amount;
  final String? currencyCode;
  final String? notes;
}
