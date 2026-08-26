import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/currency_statistics_entity.dart';
class ExpenseStatisticsEntity {
  const ExpenseStatisticsEntity({required this.vehicleId, required this.totalExpenseRecords, required this.totalExpenseAmountByCurrency, required this.averageExpenseAmountByCurrency, required this.expenseByCategory, required this.latestExpenseDate});
  final String vehicleId; final int totalExpenseRecords; final List<CurrencyTotalEntity> totalExpenseAmountByCurrency; final List<CurrencyAverageEntity> averageExpenseAmountByCurrency; final List<ExpenseCategoryStatisticsEntity> expenseByCategory; final DateTime? latestExpenseDate;
}
class ExpenseCategoryStatisticsEntity {
  const ExpenseCategoryStatisticsEntity({required this.category, required this.recordCount, required this.totalAmountByCurrency});
  final ExpenseCategory category; final int recordCount; final List<CurrencyTotalEntity> totalAmountByCurrency;
}
