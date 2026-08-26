import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/expense/delete_expense_entity.dart';

part 'delete_expense_model.g.dart';

@JsonSerializable()
class DeleteExpenseModel
    extends BaseTransformResponseModel<DeleteExpenseEntity> {
  const DeleteExpenseModel({required this.deleted});

  final bool deleted;

  factory DeleteExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteExpenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteExpenseModelToJson(this);

  @override
  DeleteExpenseEntity toEntity() => DeleteExpenseEntity(deleted: deleted);
}
