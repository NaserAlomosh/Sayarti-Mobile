import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/base/page_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/fuel/fuel_record_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_record_entity.dart';
class GetFuelRecordsResponseModel extends BaseResponseModel<PageModel<FuelRecordModel, FuelRecordEntity>> {
  const GetFuelRecordsResponseModel({required super.success, super.data, super.message, super.error});
  factory GetFuelRecordsResponseModel.fromJson(Map<String, dynamic> json) => GetFuelRecordsResponseModel(success: json['success'] as bool, data: json['data'] == null ? null : PageModel.fromJson(json['data'] as Map<String, dynamic>, FuelRecordModel.fromJson), message: json['message'] as String?, error: json['error'] == null ? null : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>));
}
