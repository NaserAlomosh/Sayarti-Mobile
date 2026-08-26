import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/vehicle_activity/activity_type_converter.dart';
import 'package:sayarti_mobile/domain/entity/remote/vehicle_activity/vehicle_activity_entity.dart';

part 'vehicle_activity_model.g.dart';

@JsonSerializable()
class VehicleActivityModel
    extends BaseTransformResponseModel<VehicleActivityEntity> {
  const VehicleActivityModel({
    required this.type,
    required this.referenceId,
    required this.vehicleId,
    required this.title,
    required this.occurredAt,
    required this.amount,
    required this.currencyCode,
  });

  @JsonKey(fromJson: activityTypeFromJson, toJson: activityTypeToJson)
  final ActivityType type;
  final String referenceId;
  final String vehicleId;
  final String title;
  final DateTime occurredAt;
  final double? amount;
  final String? currencyCode;

  factory VehicleActivityModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleActivityModelToJson(this);

  @override
  VehicleActivityEntity toEntity() => VehicleActivityEntity(
    type: type,
    referenceId: referenceId,
    vehicleId: vehicleId,
    title: title,
    occurredAt: occurredAt,
    amount: amount,
    currencyCode: currencyCode,
  );
}
