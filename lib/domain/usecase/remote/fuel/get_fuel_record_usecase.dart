import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_record_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/fuel/fuel_repository.dart';
@lazySingleton
class GetFuelRecordUseCase extends BaseRemoteUsecase<FuelRecordEntity, GetFuelRecordUseCaseParams> { const GetFuelRecordUseCase(this._repository); final FuelRepository _repository; @override Future<ApiResult<BaseResponseEntity<FuelRecordEntity>>> call(GetFuelRecordUseCaseParams params) => _repository.getFuelRecord(params); }
class GetFuelRecordUseCaseParams extends BaseUsecaseParams { const GetFuelRecordUseCaseParams({required this.vehicleId, required this.fuelRecordId}); final String vehicleId; final String fuelRecordId; }
