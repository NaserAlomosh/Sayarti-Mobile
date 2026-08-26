import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/device/device_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/device/device_repository.dart';

@lazySingleton
class UpdateFcmTokenUseCase
    extends BaseRemoteUsecase<DeviceEntity, UpdateFcmTokenUseCaseParams> {
  const UpdateFcmTokenUseCase(this._repository);

  final DeviceRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<DeviceEntity>>> call(
    UpdateFcmTokenUseCaseParams params,
  ) => _repository.updateFcmToken(params);
}

class UpdateFcmTokenUseCaseParams extends BaseUsecaseParams {
  const UpdateFcmTokenUseCaseParams({
    required this.deviceId,
    required this.fcmToken,
  });

  final String deviceId;
  final String fcmToken;
}
