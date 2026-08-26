import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle_activity/vehicle_activity_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle_activity/get_vehicle_activity_usecase.dart';

abstract class VehicleActivityRepository {
  Future<ApiResult<BaseResponseEntity<List<VehicleActivityEntity>>>>
  getVehicleActivity(GetVehicleActivityUseCaseParams params);
}
