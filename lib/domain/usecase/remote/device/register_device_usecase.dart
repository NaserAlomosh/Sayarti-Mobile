import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/device/device_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/device/device_repository.dart';

@lazySingleton
class RegisterDeviceUseCase
    extends BaseRemoteUsecase<DeviceEntity, RegisterDeviceUseCaseParams> {
  const RegisterDeviceUseCase(this._repository);

  final DeviceRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<DeviceEntity>>> call(
    RegisterDeviceUseCaseParams params,
  ) => _repository.registerDevice(params);
}

class RegisterDeviceUseCaseParams extends BaseUsecaseParams {
  const RegisterDeviceUseCaseParams({
    required this.deviceIdentifier,
    required this.platform,
    required this.fcmToken,
  });

  final String deviceIdentifier;
  final DevicePlatform platform;
  final String fcmToken;
}
