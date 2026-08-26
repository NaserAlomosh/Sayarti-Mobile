import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/delete_reminder_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/reminder/reminder_repository.dart';

@lazySingleton
class DeleteReminderUseCase extends BaseRemoteUsecase<DeleteReminderEntity, DeleteReminderUseCaseParams> {
  const DeleteReminderUseCase(this._repository);
  final ReminderRepository _repository;
  @override
  Future<ApiResult<BaseResponseEntity<DeleteReminderEntity>>> call(DeleteReminderUseCaseParams params) => _repository.deleteReminder(params);
}

class DeleteReminderUseCaseParams extends BaseUsecaseParams {
  const DeleteReminderUseCaseParams({required this.vehicleId, required this.reminderId});
  final String vehicleId;
  final String reminderId;
}
