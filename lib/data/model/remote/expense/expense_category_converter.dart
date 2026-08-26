import 'package:sayarti_mobile/domain/entity/remote/expense/expense_entity.dart';

ExpenseCategory expenseCategoryFromJson(String value) => switch (value) {
  'FUEL' => ExpenseCategory.fuel,
  'MAINTENANCE' => ExpenseCategory.maintenance,
  'INSURANCE' => ExpenseCategory.insurance,
  'REGISTRATION' => ExpenseCategory.registration,
  'PARKING' => ExpenseCategory.parking,
  'TOLL' => ExpenseCategory.toll,
  'WASH' => ExpenseCategory.wash,
  'REPAIR' => ExpenseCategory.repair,
  'ACCESSORY' => ExpenseCategory.accessory,
  'OTHER' => ExpenseCategory.other,
  _ => throw FormatException('Unknown expense category: $value'),
};

ExpenseCategory? expenseCategoryNullableFromJson(String? value) =>
    value == null ? null : expenseCategoryFromJson(value);

String expenseCategoryToJson(ExpenseCategory value) => switch (value) {
  ExpenseCategory.fuel => 'FUEL',
  ExpenseCategory.maintenance => 'MAINTENANCE',
  ExpenseCategory.insurance => 'INSURANCE',
  ExpenseCategory.registration => 'REGISTRATION',
  ExpenseCategory.parking => 'PARKING',
  ExpenseCategory.toll => 'TOLL',
  ExpenseCategory.wash => 'WASH',
  ExpenseCategory.repair => 'REPAIR',
  ExpenseCategory.accessory => 'ACCESSORY',
  ExpenseCategory.other => 'OTHER',
};

String? expenseCategoryNullableToJson(ExpenseCategory? value) =>
    value == null ? null : expenseCategoryToJson(value);
