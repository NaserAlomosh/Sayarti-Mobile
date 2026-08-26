import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/expense/expense_model.dart';

part 'expense_response_model.g.dart';

@JsonSerializable()
class ExpenseResponseModel extends BaseResponseModel<ExpenseModel> {
  const ExpenseResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory ExpenseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseResponseModelToJson(this);
}
