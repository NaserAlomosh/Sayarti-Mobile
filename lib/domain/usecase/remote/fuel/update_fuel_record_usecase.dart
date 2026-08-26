import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_record_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/fuel/fuel_repository.dart';
@lazySingleton
class UpdateFuelRecordUseCase extends BaseRemoteUsecase<FuelRecordEntity, UpdateFuelRecordUseCaseParams> { const UpdateFuelRecordUseCase(this._repository); final FuelRepository _repository; @override Future<ApiResult<BaseResponseEntity<FuelRecordEntity>>> call(UpdateFuelRecordUseCaseParams params) => _repository.updateFuelRecord(params); }
class UpdateFuelRecordUseCaseParams extends BaseUsecaseParams { const UpdateFuelRecordUseCaseParams({required this.vehicleId, required this.fuelRecordId, this.quantityLiters, this.pricePerLiter, this.currencyCode, this.filledAt, this.fullTank, this.stationName, this.notes}); final String vehicleId; final String fuelRecordId; final double? quantityLiters; final double? pricePerLiter; final String? currencyCode; final DateTime? filledAt; final bool? fullTank; final String? stationName; final String? notes; }
