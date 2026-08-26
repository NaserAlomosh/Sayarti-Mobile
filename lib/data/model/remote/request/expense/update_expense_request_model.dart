import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/model/remote/expense/expense_category_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';

part 'update_expense_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateExpenseRequestModel {
  const UpdateExpenseRequestModel({
    this.category,
    this.title,
    this.expenseDate,
    this.amount,
    this.currencyCode,
    this.notes,
  });

  @JsonKey(
    fromJson: expenseCategoryNullableFromJson,
    toJson: expenseCategoryNullableToJson,
  )
  final ExpenseCategory? category;
  final String? title;
  final DateTime? expenseDate;
  final double? amount;
  final String? currencyCode;
  final String? notes;

  factory UpdateExpenseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateExpenseRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateExpenseRequestModelToJson(this);
}
