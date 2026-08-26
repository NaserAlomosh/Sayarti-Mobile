import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/reminder_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/reminder/reminder_repository.dart';

@lazySingleton
class UpdateReminderUseCase extends BaseRemoteUsecase<ReminderEntity, UpdateReminderUseCaseParams> {
  const UpdateReminderUseCase(this._repository);
  final ReminderRepository _repository;
  @override
  Future<ApiResult<BaseResponseEntity<ReminderEntity>>> call(UpdateReminderUseCaseParams params) => _repository.updateReminder(params);
}

class UpdateReminderUseCaseParams extends BaseUsecaseParams {
  const UpdateReminderUseCaseParams({required this.vehicleId, required this.reminderId, this.category, this.title, this.description, this.triggerType, this.targetDate, this.targetMileage});
  final String vehicleId;
  final String reminderId;
  final ReminderCategory? category;
  final String? title;
  final String? description;
  final ReminderTriggerType? triggerType;
  final DateTime? targetDate;
  final int? targetMileage;
}
