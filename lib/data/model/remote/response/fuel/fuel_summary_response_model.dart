import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/fuel/fuel_summary_model.dart';
part 'fuel_summary_response_model.g.dart';
@JsonSerializable()
class FuelSummaryResponseModel extends BaseResponseModel<FuelSummaryModel> {
  const FuelSummaryResponseModel({required super.success, super.data, super.message, super.error});
  factory FuelSummaryResponseModel.fromJson(Map<String, dynamic> json) => _$FuelSummaryResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FuelSummaryResponseModelToJson(this);
}
