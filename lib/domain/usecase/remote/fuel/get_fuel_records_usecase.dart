import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/fuel/fuel_record_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/fuel/fuel_repository.dart';
@lazySingleton
class GetFuelRecordsUseCase extends BaseRemoteUsecase<PaginatedEntity<FuelRecordEntity>, GetFuelRecordsUseCaseParams> { const GetFuelRecordsUseCase(this._repository); final FuelRepository _repository; @override Future<ApiResult<BaseResponseEntity<PaginatedEntity<FuelRecordEntity>>>> call(GetFuelRecordsUseCaseParams params) => _repository.getFuelRecords(params); }
class GetFuelRecordsUseCaseParams extends BaseUsecaseParams { const GetFuelRecordsUseCaseParams({required this.vehicleId, this.page = 0, this.size = 20, this.sortBy, this.sortDirection, this.from, this.to}); final String vehicleId; final int page; final int size; final String? sortBy; final String? sortDirection; final DateTime? from; final DateTime? to; }
