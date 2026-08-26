// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_request_model.dart';

UpdateExpenseRequestModel _$UpdateExpenseRequestModelFromJson(Map<String, dynamic> json) => UpdateExpenseRequestModel(category: expenseCategoryNullableFromJson(json['category'] as String?), title: json['title'] as String?, expenseDate: json['expenseDate'] == null ? null : DateTime.parse(json['expenseDate'] as String), amount: (json['amount'] as num?)?.toDouble(), currencyCode: json['currencyCode'] as String?, notes: json['notes'] as String?);
Map<String, dynamic> _$UpdateExpenseRequestModelToJson(UpdateExpenseRequestModel instance) => <String, dynamic>{if (instance.category case final value?) 'category': expenseCategoryNullableToJson(value), if (instance.title case final value?) 'title': value, if (instance.expenseDate case final value?) 'expenseDate': value.toIso8601String(), if (instance.amount case final value?) 'amount': value, if (instance.currencyCode case final value?) 'currencyCode': value, if (instance.notes case final value?) 'notes': value};
