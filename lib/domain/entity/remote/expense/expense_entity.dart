enum ExpenseCategory {
  fuel,
  maintenance,
  insurance,
  registration,
  parking,
  toll,
  wash,
  repair,
  accessory,
  other,
}

class ExpenseEntity {
  const ExpenseEntity({
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
  final ExpenseCategory category;
  final String title;
  final DateTime expenseDate;
  final double amount;
  final String currencyCode;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
}
