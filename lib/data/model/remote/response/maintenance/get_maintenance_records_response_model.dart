import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/base/page_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/maintenance/maintenance_record_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';

class GetMaintenanceRecordsResponseModel extends BaseResponseModel<
    PageModel<MaintenanceRecordModel, MaintenanceRecordEntity>> {
  const GetMaintenanceRecordsResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory GetMaintenanceRecordsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetMaintenanceRecordsResponseModel(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : PageModel.fromJson(
            json['data'] as Map<String, dynamic>,
            MaintenanceRecordModel.fromJson,
          ),
    message: json['message'] as String?,
    error: json['error'] == null
        ? null
        : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
  );
}
