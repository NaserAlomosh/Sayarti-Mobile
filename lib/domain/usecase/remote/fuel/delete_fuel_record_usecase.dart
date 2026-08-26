import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/delete_fuel_record_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/fuel/fuel_repository.dart';
@lazySingleton
class DeleteFuelRecordUseCase extends BaseRemoteUsecase<DeleteFuelRecordEntity, DeleteFuelRecordUseCaseParams> { const DeleteFuelRecordUseCase(this._repository); final FuelRepository _repository; @override Future<ApiResult<BaseResponseEntity<DeleteFuelRecordEntity>>> call(DeleteFuelRecordUseCaseParams params) => _repository.deleteFuelRecord(params); }
class DeleteFuelRecordUseCaseParams extends BaseUsecaseParams { const DeleteFuelRecordUseCaseParams({required this.vehicleId, required this.fuelRecordId}); final String vehicleId; final String fuelRecordId; }
