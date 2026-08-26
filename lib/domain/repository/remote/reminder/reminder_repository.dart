import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/delete_reminder_entity.dart';
import 'package:sayarti_mobile/domain/entity/remote/reminder/reminder_entity.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/complete_reminder_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/create_reminder_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/delete_reminder_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/get_reminder_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/get_reminders_usecase.dart';
import 'package:sayarti_mobile/domain/usecase/remote/reminder/update_reminder_usecase.dart';

abstract class ReminderRepository {
  Future<ApiResult<BaseResponseEntity<ReminderEntity>>> createReminder(
    CreateReminderUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<List<ReminderEntity>>>> getReminders(
    GetRemindersUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<ReminderEntity>>> getReminder(
    GetReminderUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<ReminderEntity>>> updateReminder(
    UpdateReminderUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<ReminderEntity>>> completeReminder(
    CompleteReminderUseCaseParams params,
  );

  Future<ApiResult<BaseResponseEntity<DeleteReminderEntity>>> deleteReminder(
    DeleteReminderUseCaseParams params,
  );
}
