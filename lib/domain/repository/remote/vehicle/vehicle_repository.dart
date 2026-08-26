import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/entity/paginated_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/delete_vehicle_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/create_vehicle_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/delete_vehicle_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/get_vehicle_details_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/get_vehicles_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/update_vehicle_mileage_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/vehicle/update_vehicle_usecase.dart';

abstract class VehicleRepository {
  Future<ApiResult<BaseResponseEntity<VehicleEntity>>> createVehicle(CreateVehicleUseCaseParams params);
  Future<ApiResult<BaseResponseEntity<PaginatedEntity<VehicleEntity>>>> getVehicles(GetVehiclesUseCaseParams params);
  Future<ApiResult<BaseResponseEntity<VehicleEntity>>> getVehicleDetails(GetVehicleDetailsUseCaseParams params);
  Future<ApiResult<BaseResponseEntity<VehicleEntity>>> updateVehicle(UpdateVehicleUseCaseParams params);
  Future<ApiResult<BaseResponseEntity<VehicleEntity>>> updateVehicleMileage(UpdateVehicleMileageUseCaseParams params);
  Future<ApiResult<BaseResponseEntity<DeleteVehicleEntity>>> deleteVehicle(DeleteVehicleUseCaseParams params);
}
