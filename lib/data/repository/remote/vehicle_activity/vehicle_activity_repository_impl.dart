import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle_activity/vehicle_activity_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/vehicle_activity/vehicle_activity_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle_activity/get_vehicle_activity_usecase.dart';

@LazySingleton(as: VehicleActivityRepository)
class VehicleActivityRepositoryImpl implements VehicleActivityRepository {
  const VehicleActivityRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResult<BaseResponseEntity<List<VehicleActivityEntity>>>>
  getVehicleActivity(GetVehicleActivityUseCaseParams params) =>
      SafeRequest.executeList<VehicleActivityEntity>(
        request: _apiService.getVehicleActivity(params.vehicleId, params.limit),
      );
}
