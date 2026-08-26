import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/reminder/delete_reminder_model.dart';

part 'delete_reminder_response_model.g.dart';

@JsonSerializable()
class DeleteReminderResponseModel extends BaseResponseModel<DeleteReminderModel> {
  const DeleteReminderResponseModel({required super.success, super.data, super.message, super.error});
  factory DeleteReminderResponseModel.fromJson(Map<String, dynamic> json) => _$DeleteReminderResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteReminderResponseModelToJson(this);
}
