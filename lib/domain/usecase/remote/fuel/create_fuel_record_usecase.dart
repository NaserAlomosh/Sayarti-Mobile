import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_record_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/fuel/fuel_repository.dart';
@lazySingleton
class CreateFuelRecordUseCase extends BaseRemoteUsecase<FuelRecordEntity, CreateFuelRecordUseCaseParams> { const CreateFuelRecordUseCase(this._repository); final FuelRepository _repository; @override Future<ApiResult<BaseResponseEntity<FuelRecordEntity>>> call(CreateFuelRecordUseCaseParams params) => _repository.createFuelRecord(params); }
class CreateFuelRecordUseCaseParams extends BaseUsecaseParams { const CreateFuelRecordUseCaseParams({required this.vehicleId, required this.odometerKm, required this.quantityLiters, required this.pricePerLiter, this.currencyCode, required this.filledAt, required this.fullTank, this.stationName, this.notes}); final String vehicleId; final double odometerKm; final double quantityLiters; final double pricePerLiter; final String? currencyCode; final DateTime filledAt; final bool fullTank; final String? stationName; final String? notes; }
