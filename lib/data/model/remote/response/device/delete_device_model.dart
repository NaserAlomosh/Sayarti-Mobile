import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/device/delete_device_entity.dart';

part 'delete_device_model.g.dart';

@JsonSerializable()
class DeleteDeviceModel
    extends BaseTransformResponseModel<DeleteDeviceEntity> {
  const DeleteDeviceModel({required this.deleted});

  final bool deleted;

  factory DeleteDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteDeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteDeviceModelToJson(this);

  @override
  DeleteDeviceEntity toEntity() => DeleteDeviceEntity(deleted: deleted);
}
