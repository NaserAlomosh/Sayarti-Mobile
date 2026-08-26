import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_summary_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/fuel/fuel_repository.dart';
@lazySingleton
class GetFuelSummaryUseCase extends BaseRemoteUsecase<FuelSummaryEntity, GetFuelSummaryUseCaseParams> { const GetFuelSummaryUseCase(this._repository); final FuelRepository _repository; @override Future<ApiResult<BaseResponseEntity<FuelSummaryEntity>>> call(GetFuelSummaryUseCaseParams params) => _repository.getFuelSummary(params); }
class GetFuelSummaryUseCaseParams extends BaseUsecaseParams { const GetFuelSummaryUseCaseParams({required this.vehicleId, this.month}); final String vehicleId; final String? month; }
