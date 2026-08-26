// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_expense_request_model.dart';

CreateExpenseRequestModel _$CreateExpenseRequestModelFromJson(Map<String, dynamic> json) => CreateExpenseRequestModel(category: expenseCategoryFromJson(json['category'] as String), title: json['title'] as String, expenseDate: DateTime.parse(json['expenseDate'] as String), amount: (json['amount'] as num).toDouble(), currencyCode: json['currencyCode'] as String?, notes: json['notes'] as String?);
Map<String, dynamic> _$CreateExpenseRequestModelToJson(CreateExpenseRequestModel instance) => <String, dynamic>{'category': expenseCategoryToJson(instance.category), 'title': instance.title, 'expenseDate': instance.expenseDate.toIso8601String(), 'amount': instance.amount, if (instance.currencyCode case final value?) 'currencyCode': value, if (instance.notes case final value?) 'notes': value};
