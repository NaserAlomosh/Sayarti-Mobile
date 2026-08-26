import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/device/delete_device_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/device/device_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/device/delete_device_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/device/register_device_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/device/update_fcm_token_usecase.dart';

abstract class DeviceRepository {
  Future<ApiResult<BaseResponseEntity<DeviceEntity>>> registerDevice(
    RegisterDeviceUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<DeviceEntity>>> updateFcmToken(
    UpdateFcmTokenUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<DeleteDeviceEntity>>> deleteDevice(
    DeleteDeviceUseCaseParams params,
  );
}
