import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/device/device_model.dart';

part 'device_response_model.g.dart';

@JsonSerializable()
class DeviceResponseModel extends BaseResponseModel<DeviceModel> {
  const DeviceResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory DeviceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceResponseModelToJson(this);
}
