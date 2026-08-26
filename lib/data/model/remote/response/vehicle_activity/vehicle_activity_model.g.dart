// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleActivityModel _$VehicleActivityModelFromJson(
  Map<String, dynamic> json,
) => VehicleActivityModel(
  type: activityTypeFromJson(json['type'] as String),
  referenceId: json['referenceId'] as String,
  vehicleId: json['vehicleId'] as String,
  title: json['title'] as String,
  occurredAt: DateTime.parse(json['occurredAt'] as String),
  amount: (json['amount'] as num?)?.toDouble(),
  currencyCode: json['currencyCode'] as String?,
);

Map<String, dynamic> _$VehicleActivityModelToJson(
  VehicleActivityModel instance,
) => <String, dynamic>{
  'type': activityTypeToJson(instance.type),
  'referenceId': instance.referenceId,
  'vehicleId': instance.vehicleId,
  'title': instance.title,
  'occurredAt': instance.occurredAt.toIso8601String(),
  'amount': instance.amount,
  'currencyCode': instance.currencyCode,
};
