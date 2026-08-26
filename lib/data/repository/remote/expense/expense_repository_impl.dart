import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/model/remote/request/expense/create_expense_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/expense/update_expense_request_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/delete_expense_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/expense/expense_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/expense/create_expense_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/expense/delete_expense_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/expense/get_expense_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/expense/get_expenses_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/expense/update_expense_usecase.dart';

@LazySingleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  const ExpenseRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResult<BaseResponseEntity<ExpenseEntity>>> createExpense(
    CreateExpenseUseCaseParams params,
  ) => SafeRequest.execute<ExpenseEntity>(
    request: _apiService.createExpense(
      params.vehicleId,
      CreateExpenseRequestModel(
        category: params.category,
        title: params.title,
        expenseDate: params.expenseDate,
        amount: params.amount,
        currencyCode: params.currencyCode,
        notes: params.notes,
      ),
    ),
  );

  @override
  Future<ApiResult<BaseResponseEntity<PaginatedEntity<ExpenseEntity>>>>
  getExpenses(GetExpensesUseCaseParams params) =>
      SafeRequest.execute<PaginatedEntity<ExpenseEntity>>(
        request: _apiService.getExpenses(
          params.vehicleId,
          params.page,
          params.size,
          params.sortBy,
          params.sortDirection,
          params.from,
          params.to,
        ),
      );

  @override
  Future<ApiResult<BaseResponseEntity<ExpenseEntity>>> getExpense(
    GetExpenseUseCaseParams params,
  ) => SafeRequest.execute<ExpenseEntity>(
    request: _apiService.getExpense(params.vehicleId, params.expenseId),
  );

  @override
  Future<ApiResult<BaseResponseEntity<ExpenseEntity>>> updateExpense(
    UpdateExpenseUseCaseParams params,
  ) => SafeRequest.execute<ExpenseEntity>(
    request: _apiService.updateExpense(
      params.vehicleId,
      params.expenseId,
      UpdateExpenseRequestModel(
        category: params.category,
        title: params.title,
        expenseDate: params.expenseDate,
        amount: params.amount,
        currencyCode: params.currencyCode,
        notes: params.notes,
      ),
    ),
  );

  @override
  Future<ApiResult<BaseResponseEntity<DeleteExpenseEntity>>> deleteExpense(
    DeleteExpenseUseCaseParams params,
  ) => SafeRequest.execute<DeleteExpenseEntity>(
    request: _apiService.deleteExpense(params.vehicleId, params.expenseId),
  );
}
