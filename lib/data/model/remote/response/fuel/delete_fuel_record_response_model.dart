import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/fuel/delete_fuel_record_model.dart';
part 'delete_fuel_record_response_model.g.dart';
@JsonSerializable()
class DeleteFuelRecordResponseModel extends BaseResponseModel<DeleteFuelRecordModel> {
  const DeleteFuelRecordResponseModel({required super.success, super.data, super.message, super.error});
  factory DeleteFuelRecordResponseModel.fromJson(Map<String, dynamic> json) => _$DeleteFuelRecordResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteFuelRecordResponseModelToJson(this);
}
