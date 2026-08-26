import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/reminder/reminder_model.dart';

part 'get_reminders_response_model.g.dart';

@JsonSerializable()
class GetRemindersResponseModel extends BaseResponseModel<List<ReminderModel>> {
  const GetRemindersResponseModel({required super.success, super.data, super.message, super.error});
  factory GetRemindersResponseModel.fromJson(Map<String, dynamic> json) => _$GetRemindersResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetRemindersResponseModelToJson(this);
}
