import 'package:sayarti_mobile/domain/entity/remote/maintenance/maintenance_record_entity.dart';

MaintenanceCategory maintenanceCategoryFromJson(String value) =>
    switch (value) {
      'OIL_CHANGE' => MaintenanceCategory.oilChange,
      'FILTER_CHANGE' => MaintenanceCategory.filterChange,
      'TIRE_SERVICE' => MaintenanceCategory.tireService,
      'BRAKE_SERVICE' => MaintenanceCategory.brakeService,
      'BATTERY' => MaintenanceCategory.battery,
      'ENGINE' => MaintenanceCategory.engine,
      'TRANSMISSION' => MaintenanceCategory.transmission,
      'COOLING_SYSTEM' => MaintenanceCategory.coolingSystem,
      'ELECTRICAL' => MaintenanceCategory.electrical,
      'SUSPENSION' => MaintenanceCategory.suspension,
      'AIR_CONDITIONING' => MaintenanceCategory.airConditioning,
      'INSPECTION' => MaintenanceCategory.inspection,
      'GENERAL_SERVICE' => MaintenanceCategory.generalService,
      'OTHER' => MaintenanceCategory.other,
      _ => throw FormatException('Unknown maintenance category: $value'),
    };

MaintenanceCategory? maintenanceCategoryNullableFromJson(String? value) =>
    value == null ? null : maintenanceCategoryFromJson(value);

String maintenanceCategoryToJson(MaintenanceCategory value) => switch (value) {
  MaintenanceCategory.oilChange => 'OIL_CHANGE',
  MaintenanceCategory.filterChange => 'FILTER_CHANGE',
  MaintenanceCategory.tireService => 'TIRE_SERVICE',
  MaintenanceCategory.brakeService => 'BRAKE_SERVICE',
  MaintenanceCategory.battery => 'BATTERY',
  MaintenanceCategory.engine => 'ENGINE',
  MaintenanceCategory.transmission => 'TRANSMISSION',
  MaintenanceCategory.coolingSystem => 'COOLING_SYSTEM',
  MaintenanceCategory.electrical => 'ELECTRICAL',
  MaintenanceCategory.suspension => 'SUSPENSION',
  MaintenanceCategory.airConditioning => 'AIR_CONDITIONING',
  MaintenanceCategory.inspection => 'INSPECTION',
  MaintenanceCategory.generalService => 'GENERAL_SERVICE',
  MaintenanceCategory.other => 'OTHER',
};

String? maintenanceCategoryNullableToJson(MaintenanceCategory? value) =>
    value == null ? null : maintenanceCategoryToJson(value);
