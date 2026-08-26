// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateExpenseRequestModel _$UpdateExpenseRequestModelFromJson(
  Map<String, dynamic> json,
) => UpdateExpenseRequestModel(
  category: expenseCategoryNullableFromJson(json['category'] as String?),
  title: json['title'] as String?,
  expenseDate: json['expenseDate'] == null
      ? null
      : DateTime.parse(json['expenseDate'] as String),
  amount: (json['amount'] as num?)?.toDouble(),
  currencyCode: json['currencyCode'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$UpdateExpenseRequestModelToJson(
  UpdateExpenseRequestModel instance,
) => <String, dynamic>{
  'category': ?expenseCategoryNullableToJson(instance.category),
  'title': ?instance.title,
  'expenseDate': ?instance.expenseDate?.toIso8601String(),
  'amount': ?instance.amount,
  'currencyCode': ?instance.currencyCode,
  'notes': ?instance.notes,
};
