// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceRecordModel _$MaintenanceRecordModelFromJson(
  Map<String, dynamic> json,
) => MaintenanceRecordModel(
  id: json['id'] as String,
  vehicleId: json['vehicleId'] as String,
  category: maintenanceCategoryFromJson(json['category'] as String),
  title: json['title'] as String,
  serviceDate: DateTime.parse(json['serviceDate'] as String),
  mileageKm: (json['mileageKm'] as num).toDouble(),
  cost: (json['cost'] as num).toDouble(),
  currencyCode: json['currencyCode'] as String,
  serviceProvider: json['serviceProvider'] as String?,
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$MaintenanceRecordModelToJson(
  MaintenanceRecordModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'vehicleId': instance.vehicleId,
  'category': maintenanceCategoryToJson(instance.category),
  'title': instance.title,
  'serviceDate': instance.serviceDate.toIso8601String(),
  'mileageKm': instance.mileageKm,
  'cost': instance.cost,
  'currencyCode': instance.currencyCode,
  'serviceProvider': instance.serviceProvider,
  'notes': instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
