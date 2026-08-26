import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/maintenance_statistics_model.dart';
part 'maintenance_statistics_response_model.g.dart';
@JsonSerializable()
class MaintenanceStatisticsResponseModel extends BaseResponseModel<MaintenanceStatisticsModel> {
 const MaintenanceStatisticsResponseModel({required super.success, super.data, super.message, super.error});
 factory MaintenanceStatisticsResponseModel.fromJson(Map<String,dynamic> json)=>_$MaintenanceStatisticsResponseModelFromJson(json); Map<String,dynamic> toJson()=>_$MaintenanceStatisticsResponseModelToJson(this);
}
