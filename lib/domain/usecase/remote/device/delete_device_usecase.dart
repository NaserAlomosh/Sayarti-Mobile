import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/device/delete_device_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/device/device_repository.dart';

@lazySingleton
class DeleteDeviceUseCase
    extends BaseRemoteUsecase<DeleteDeviceEntity, DeleteDeviceUseCaseParams> {
  const DeleteDeviceUseCase(this._repository);

  final DeviceRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<DeleteDeviceEntity>>> call(
    DeleteDeviceUseCaseParams params,
  ) => _repository.deleteDevice(params);
}

class DeleteDeviceUseCaseParams extends BaseUsecaseParams {
  const DeleteDeviceUseCaseParams({required this.deviceId});

  final String deviceId;
}
