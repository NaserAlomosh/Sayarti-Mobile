import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/reminder/reminder_model.dart';

part 'reminder_response_model.g.dart';

@JsonSerializable()
class ReminderResponseModel extends BaseResponseModel<ReminderModel> {
  const ReminderResponseModel({required super.success, super.data, super.message, super.error});
  factory ReminderResponseModel.fromJson(Map<String, dynamic> json) => _$ReminderResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReminderResponseModelToJson(this);
}
