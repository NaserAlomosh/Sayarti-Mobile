import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/device/delete_device_model.dart';

part 'delete_device_response_model.g.dart';

@JsonSerializable()
class DeleteDeviceResponseModel extends BaseResponseModel<DeleteDeviceModel> {
  const DeleteDeviceResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory DeleteDeviceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteDeviceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteDeviceResponseModelToJson(this);
}
