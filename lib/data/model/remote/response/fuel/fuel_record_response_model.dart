import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/fuel/fuel_record_model.dart';
part 'fuel_record_response_model.g.dart';
@JsonSerializable()
class FuelRecordResponseModel extends BaseResponseModel<FuelRecordModel> {
  const FuelRecordResponseModel({required super.success, super.data, super.message, super.error});
  factory FuelRecordResponseModel.fromJson(Map<String, dynamic> json) => _$FuelRecordResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FuelRecordResponseModelToJson(this);
}
