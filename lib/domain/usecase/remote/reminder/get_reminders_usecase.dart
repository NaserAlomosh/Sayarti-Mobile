import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/reminder_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/reminder/reminder_repository.dart';

@lazySingleton
class GetRemindersUseCase extends BaseRemoteUsecase<List<ReminderEntity>, GetRemindersUseCaseParams> {
  const GetRemindersUseCase(this._repository);
  final ReminderRepository _repository;
  @override
  Future<ApiResult<BaseResponseEntity<List<ReminderEntity>>>> call(GetRemindersUseCaseParams params) => _repository.getReminders(params);
}

class GetRemindersUseCaseParams extends BaseUsecaseParams {
  const GetRemindersUseCaseParams({required this.vehicleId});
  final String vehicleId;
}
