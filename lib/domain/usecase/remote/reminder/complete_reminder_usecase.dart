import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/reminder_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/reminder/reminder_repository.dart';

@lazySingleton
class CompleteReminderUseCase extends BaseRemoteUsecase<ReminderEntity, CompleteReminderUseCaseParams> {
  const CompleteReminderUseCase(this._repository);
  final ReminderRepository _repository;
  @override
  Future<ApiResult<BaseResponseEntity<ReminderEntity>>> call(CompleteReminderUseCaseParams params) => _repository.completeReminder(params);
}

class CompleteReminderUseCaseParams extends BaseUsecaseParams {
  const CompleteReminderUseCaseParams({required this.vehicleId, required this.reminderId});
  final String vehicleId;
  final String reminderId;
}
