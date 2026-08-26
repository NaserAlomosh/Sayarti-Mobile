import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/maintenance/maintenance_record_model.dart';

part 'maintenance_record_response_model.g.dart';

@JsonSerializable()
class MaintenanceRecordResponseModel
    extends BaseResponseModel<MaintenanceRecordModel> {
  const MaintenanceRecordResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory MaintenanceRecordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceRecordResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceRecordResponseModelToJson(this);
}
