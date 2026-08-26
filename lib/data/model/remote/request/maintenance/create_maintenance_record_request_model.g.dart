// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_maintenance_record_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMaintenanceRecordRequestModel
_$CreateMaintenanceRecordRequestModelFromJson(Map<String, dynamic> json) =>
    CreateMaintenanceRecordRequestModel(
      category: maintenanceCategoryFromJson(json['category'] as String),
      title: json['title'] as String,
      serviceDate: DateTime.parse(json['serviceDate'] as String),
      mileageKm: (json['mileageKm'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
      currencyCode: json['currencyCode'] as String?,
      serviceProvider: json['serviceProvider'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CreateMaintenanceRecordRequestModelToJson(
  CreateMaintenanceRecordRequestModel instance,
) => <String, dynamic>{
  'category': maintenanceCategoryToJson(instance.category),
  'title': instance.title,
  'serviceDate': instance.serviceDate.toIso8601String(),
  'mileageKm': instance.mileageKm,
  'cost': instance.cost,
  'currencyCode': ?instance.currencyCode,
  'serviceProvider': ?instance.serviceProvider,
  'notes': ?instance.notes,
};
