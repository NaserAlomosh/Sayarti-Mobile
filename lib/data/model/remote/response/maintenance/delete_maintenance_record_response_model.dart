import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/maintenance/delete_maintenance_record_model.dart';

part 'delete_maintenance_record_response_model.g.dart';

@JsonSerializable()
class DeleteMaintenanceRecordResponseModel
    extends BaseResponseModel<DeleteMaintenanceRecordModel> {
  const DeleteMaintenanceRecordResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory DeleteMaintenanceRecordResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteMaintenanceRecordResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeleteMaintenanceRecordResponseModelToJson(this);
}
