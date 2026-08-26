import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/currency_statistics_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/statistics/expense_statistics_entity.dart';
import 'package:sayarti_mobile/data/model/remote/expense/expense_category_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';
part 'expense_statistics_model.g.dart';
@JsonSerializable(explicitToJson: true)
class ExpenseStatisticsModel extends BaseTransformResponseModel<ExpenseStatisticsEntity> {
 const ExpenseStatisticsModel({required this.vehicleId, required this.totalExpenseRecords, required this.totalExpenseAmountByCurrency, required this.averageExpenseAmountByCurrency, required this.expenseByCategory, required this.latestExpenseDate}); final String vehicleId; final int totalExpenseRecords; final List<CurrencyTotalModel> totalExpenseAmountByCurrency; final List<CurrencyAverageModel> averageExpenseAmountByCurrency; final List<ExpenseCategoryStatisticsModel> expenseByCategory; final DateTime? latestExpenseDate;
 factory ExpenseStatisticsModel.fromJson(Map<String,dynamic> json)=>_$ExpenseStatisticsModelFromJson(json); Map<String,dynamic> toJson()=>_$ExpenseStatisticsModelToJson(this);
 @override ExpenseStatisticsEntity toEntity()=>ExpenseStatisticsEntity(vehicleId: vehicleId, totalExpenseRecords: totalExpenseRecords, totalExpenseAmountByCurrency: totalExpenseAmountByCurrency.map((e)=>e.toEntity()).toList(growable:false), averageExpenseAmountByCurrency: averageExpenseAmountByCurrency.map((e)=>e.toEntity()).toList(growable:false), expenseByCategory: expenseByCategory.map((e)=>e.toEntity()).toList(growable:false), latestExpenseDate: latestExpenseDate);
}

@JsonSerializable(explicitToJson: true)
class ExpenseCategoryStatisticsModel extends BaseTransformResponseModel<ExpenseCategoryStatisticsEntity> {
 const ExpenseCategoryStatisticsModel({required this.category, required this.recordCount, required this.totalAmountByCurrency});
 @JsonKey(fromJson: expenseCategoryFromJson, toJson: expenseCategoryToJson) final ExpenseCategory category; final int recordCount; final List<CurrencyTotalModel> totalAmountByCurrency;
 factory ExpenseCategoryStatisticsModel.fromJson(Map<String,dynamic> json)=>_$ExpenseCategoryStatisticsModelFromJson(json); Map<String,dynamic> toJson()=>_$ExpenseCategoryStatisticsModelToJson(this);
 @override ExpenseCategoryStatisticsEntity toEntity()=>ExpenseCategoryStatisticsEntity(category:category,recordCount:recordCount,totalAmountByCurrency:totalAmountByCurrency.map((e)=>e.toEntity()).toList(growable:false));
}
