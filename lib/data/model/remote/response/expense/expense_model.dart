import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/expense/expense_category_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';

part 'expense_model.g.dart';

@JsonSerializable()
class ExpenseModel extends BaseTransformResponseModel<ExpenseEntity> {
  const ExpenseModel({
    required this.id,
    required this.vehicleId,
    required this.category,
    required this.title,
    required this.expenseDate,
    required this.amount,
    required this.currencyCode,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final String id;
  final String vehicleId;
  @JsonKey(fromJson: expenseCategoryFromJson, toJson: expenseCategoryToJson)
  final ExpenseCategory category;
  final String title;
  final DateTime expenseDate;
  final double amount;
  final String currencyCode;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);

  @override
  ExpenseEntity toEntity() => ExpenseEntity(
    id: id,
    vehicleId: vehicleId,
    category: category,
    title: title,
    expenseDate: expenseDate,
    amount: amount,
    currencyCode: currencyCode,
    notes: notes,
    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
  );
}
