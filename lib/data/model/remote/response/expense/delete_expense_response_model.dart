import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/expense/delete_expense_model.dart';

part 'delete_expense_response_model.g.dart';

@JsonSerializable()
class DeleteExpenseResponseModel extends BaseResponseModel<DeleteExpenseModel> {
  const DeleteExpenseResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory DeleteExpenseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteExpenseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteExpenseResponseModelToJson(this);
}
