import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/model/remote/request/device/register_device_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/device/update_fcm_token_request_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/device/delete_device_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/device/device_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/device/device_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/device/delete_device_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/device/register_device_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/device/update_fcm_token_usecase.dart';

@LazySingleton(as: DeviceRepository)
class DeviceRepositoryImpl implements DeviceRepository {
  const DeviceRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ApiResult<BaseResponseEntity<DeviceEntity>>> registerDevice(
    RegisterDeviceUseCaseParams params,
  ) => SafeRequest.execute<DeviceEntity>(
    request: _apiService.registerDevice(
      RegisterDeviceRequestModel(
        deviceIdentifier: params.deviceIdentifier,
        platform: params.platform,
        fcmToken: params.fcmToken,
      ),
    ),
  );

  @override
  Future<ApiResult<BaseResponseEntity<DeviceEntity>>> updateFcmToken(
    UpdateFcmTokenUseCaseParams params,
  ) => SafeRequest.execute<DeviceEntity>(
    request: _apiService.updateFcmToken(
      params.deviceId,
      UpdateFcmTokenRequestModel(fcmToken: params.fcmToken),
    ),
  );

  @override
  Future<ApiResult<BaseResponseEntity<DeleteDeviceEntity>>> deleteDevice(
    DeleteDeviceUseCaseParams params,
  ) => SafeRequest.execute<DeleteDeviceEntity>(
    request: _apiService.deleteDevice(params.deviceId),
  );
}
