import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/base/page_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/vehicle/vehicle_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';

class GetVehiclesResponseModel extends BaseResponseModel<PageModel<VehicleModel, VehicleEntity>> {
 const GetVehiclesResponseModel({required super.success, super.data, super.message, super.error});
 factory GetVehiclesResponseModel.fromJson(Map<String,dynamic> json) => GetVehiclesResponseModel(
   success: json['success'] as bool,
   data: json['data'] == null ? null : PageModel.fromJson(json['data'] as Map<String,dynamic>, VehicleModel.fromJson),
   message: json['message'] as String?,
   error: json['error'] == null ? null : ApiErrorModel.fromJson(json['error'] as Map<String,dynamic>),
 );
}
