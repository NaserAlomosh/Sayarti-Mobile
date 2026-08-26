import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/model/remote/expense/expense_category_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';

part 'create_expense_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CreateExpenseRequestModel {
  const CreateExpenseRequestModel({
    required this.category,
    required this.title,
    required this.expenseDate,
    required this.amount,
    this.currencyCode,
    this.notes,
  });

  @JsonKey(fromJson: expenseCategoryFromJson, toJson: expenseCategoryToJson)
  final ExpenseCategory category;
  final String title;
  final DateTime expenseDate;
  final double amount;
  final String? currencyCode;
  final String? notes;

  factory CreateExpenseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateExpenseRequestModelToJson(this);
}
