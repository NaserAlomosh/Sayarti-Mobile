import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/delete_expense_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/expense/create_expense_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/expense/delete_expense_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/expense/get_expense_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/expense/get_expenses_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/expense/update_expense_usecase.dart';

abstract class ExpenseRepository {
  Future<ApiResult<BaseResponseEntity<ExpenseEntity>>> createExpense(
    CreateExpenseUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<PaginatedEntity<ExpenseEntity>>>>
  getExpenses(GetExpensesUseCaseParams params);

  Future<ApiResult<BaseResponseEntity<ExpenseEntity>>> getExpense(
    GetExpenseUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<ExpenseEntity>>> updateExpense(
    UpdateExpenseUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<DeleteExpenseEntity>>> deleteExpense(
    DeleteExpenseUseCaseParams params,
  );
}
