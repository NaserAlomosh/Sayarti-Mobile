import 'package:sayarti_mobile/domain/entity/remote/vehicle/vehicle_entity.dart';

PowertrainType powertrainTypeFromJson(String value) => switch (value) {
  'GASOLINE' => PowertrainType.gasoline,
  'DIESEL' => PowertrainType.diesel,
  'HYBRID' => PowertrainType.hybrid,
  'PLUG_IN_HYBRID' => PowertrainType.plugInHybrid,
  'ELECTRIC' => PowertrainType.electric,
  _ => throw FormatException('Unknown powertrain type: $value'),
};

String powertrainTypeToJson(PowertrainType value) => switch (value) {
  PowertrainType.gasoline => 'GASOLINE',
  PowertrainType.diesel => 'DIESEL',
  PowertrainType.hybrid => 'HYBRID',
  PowertrainType.plugInHybrid => 'PLUG_IN_HYBRID',
  PowertrainType.electric => 'ELECTRIC',
};

FuelType? fuelTypeFromJson(String? value) => switch (value) {
  null => null,
  'GASOLINE_90' => FuelType.gasoline90,
  'GASOLINE_95' => FuelType.gasoline95,
  'GASOLINE_98' => FuelType.gasoline98,
  'DIESEL' => FuelType.diesel,
  'OTHER' => FuelType.other,
  _ => throw FormatException('Unknown fuel type: $value'),
};

String? fuelTypeToJson(FuelType? value) => switch (value) {
  null => null,
  FuelType.gasoline90 => 'GASOLINE_90',
  FuelType.gasoline95 => 'GASOLINE_95',
  FuelType.gasoline98 => 'GASOLINE_98',
  FuelType.diesel => 'DIESEL',
  FuelType.other => 'OTHER',
};
