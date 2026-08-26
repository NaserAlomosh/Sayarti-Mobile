import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/vehicle/vehicle_repository.dart';

@lazySingleton
class GetVehiclesUseCase extends BaseRemoteUsecase<PaginatedEntity<VehicleEntity>, GetVehiclesUseCaseParams> {
  const GetVehiclesUseCase(this._repository); final VehicleRepository _repository;
  @override
  Future<ApiResult<BaseResponseEntity<PaginatedEntity<VehicleEntity>>>> call(GetVehiclesUseCaseParams params) => _repository.getVehicles(params);
}
class GetVehiclesUseCaseParams extends BaseUsecaseParams {
  const GetVehiclesUseCaseParams({this.page = 0, this.size = 20, this.sortBy, this.sortDirection});
  final int page; final int size; final String? sortBy; final String? sortDirection;
}
