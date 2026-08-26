import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/fuel_statistics_model.dart';
part 'fuel_statistics_response_model.g.dart';
@JsonSerializable()
class FuelStatisticsResponseModel extends BaseResponseModel<FuelStatisticsModel> {
 const FuelStatisticsResponseModel({required super.success, super.data, super.message, super.error});
 factory FuelStatisticsResponseModel.fromJson(Map<String,dynamic> json)=>_$FuelStatisticsResponseModelFromJson(json); Map<String,dynamic> toJson()=>_$FuelStatisticsResponseModelToJson(this);
}
