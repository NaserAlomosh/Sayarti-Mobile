import 'package:injectable/injectable.dart';
import 'package:sayarti_mobile/data/model/remote/request/reminder/create_reminder_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/reminder/update_reminder_request_model.dart';
import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/data/networking/safe_request/safe_request.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/delete_reminder_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/reminder_entity.dart';
import 'package:sayarti_mobile/domain/repository/remote/reminder/reminder_repository.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/complete_reminder_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/create_reminder_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/delete_reminder_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/get_reminder_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/get_reminders_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/update_reminder_usecase.dart';

@LazySingleton(as: ReminderRepository)
class ReminderRepositoryImpl implements ReminderRepository {
  const ReminderRepositoryImpl(this._apiService);
  final ApiService _apiService;

  @override
  Future<ApiResult<BaseResponseEntity<ReminderEntity>>> createReminder(CreateReminderUseCaseParams params) => SafeRequest.execute<ReminderEntity>(request: _apiService.createReminder(params.vehicleId, CreateReminderRequestModel(category: params.category, title: params.title, description: params.description, triggerType: params.triggerType, targetDate: params.targetDate, targetMileage: params.targetMileage)));

  @override
  Future<ApiResult<BaseResponseEntity<List<ReminderEntity>>>> getReminders(GetRemindersUseCaseParams params) => SafeRequest.executeList<ReminderEntity>(request: _apiService.getReminders(params.vehicleId));

  @override
  Future<ApiResult<BaseResponseEntity<ReminderEntity>>> getReminder(GetReminderUseCaseParams params) => SafeRequest.execute<ReminderEntity>(request: _apiService.getReminder(params.vehicleId, params.reminderId));

  @override
  Future<ApiResult<BaseResponseEntity<ReminderEntity>>> updateReminder(UpdateReminderUseCaseParams params) => SafeRequest.execute<ReminderEntity>(request: _apiService.updateReminder(params.vehicleId, params.reminderId, UpdateReminderRequestModel(category: params.category, title: params.title, description: params.description, triggerType: params.triggerType, targetDate: params.targetDate, targetMileage: params.targetMileage)));

  @override
  Future<ApiResult<BaseResponseEntity<ReminderEntity>>> completeReminder(CompleteReminderUseCaseParams params) => SafeRequest.execute<ReminderEntity>(request: _apiService.completeReminder(params.vehicleId, params.reminderId));

  @override
  Future<ApiResult<BaseResponseEntity<DeleteReminderEntity>>> deleteReminder(DeleteReminderUseCaseParams params) => SafeRequest.execute<DeleteReminderEntity>(request: _apiService.deleteReminder(params.vehicleId, params.reminderId));
}
