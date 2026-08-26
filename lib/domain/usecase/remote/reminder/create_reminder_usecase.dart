import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/reminder_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/reminder/reminder_repository.dart';

@lazySingleton
class CreateReminderUseCase
    extends BaseRemoteUsecase<ReminderEntity, CreateReminderUseCaseParams> {
  const CreateReminderUseCase(this._repository);
  final ReminderRepository _repository;

  @override
  Future<ApiResult<BaseResponseEntity<ReminderEntity>>> call(
    CreateReminderUseCaseParams params,
  ) => _repository.createReminder(params);
}

class CreateReminderUseCaseParams extends BaseUsecaseParams {
  const CreateReminderUseCaseParams({
    required this.vehicleId,
    required this.category,
    required this.title,
    required this.triggerType,
    this.description,
    this.targetDate,
    this.targetMileage,
  });
  final String vehicleId;
  final ReminderCategory category;
  final String title;
  final String? description;
  final ReminderTriggerType triggerType;
  final DateTime? targetDate;
  final int? targetMileage;
}
