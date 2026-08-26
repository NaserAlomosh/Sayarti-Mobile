import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/general_statistics_model.dart';
part 'general_statistics_response_model.g.dart';
@JsonSerializable()
class GeneralStatisticsResponseModel extends BaseResponseModel<GeneralStatisticsModel> {
 const GeneralStatisticsResponseModel({required super.success, super.data, super.message, super.error});
 factory GeneralStatisticsResponseModel.fromJson(Map<String,dynamic> json)=>_$GeneralStatisticsResponseModelFromJson(json); Map<String,dynamic> toJson()=>_$GeneralStatisticsResponseModelToJson(this);
}
