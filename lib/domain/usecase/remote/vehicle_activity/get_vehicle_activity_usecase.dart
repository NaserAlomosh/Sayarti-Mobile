import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle_activity/vehicle_activity_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/vehicle_activity/vehicle_activity_repository.dart';

@lazySingleton
class GetVehicleActivityUseCase
    extends
        BaseRemoteUsecase<
          List<VehicleActivityEntity>,
          GetVehicleActivityUseCaseParams
        > {
  const GetVehicleActivityUseCase(this._repository);

  final VehicleActivityRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<List<VehicleActivityEntity>>>> call(
    GetVehicleActivityUseCaseParams params,
  ) => _repository.getVehicleActivity(params);
}

class GetVehicleActivityUseCaseParams extends BaseUsecaseParams {
  const GetVehicleActivityUseCaseParams({
    required this.vehicleId,
    this.limit,
  }) : assert(limit == null || (limit >= 1 && limit <= 100));

  /// The limit used by the backend when [limit] is omitted.
  static const int backendDefaultLimit = 20;

  final String vehicleId;
  final int? limit;
}
