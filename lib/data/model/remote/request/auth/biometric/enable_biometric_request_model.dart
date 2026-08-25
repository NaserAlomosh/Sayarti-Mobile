import 'package:json_annotation/json_annotation.dart';

part 'enable_biometric_request_model.g.dart';

@JsonSerializable()
class EnableBiometricRequestModel {
  const EnableBiometricRequestModel({required this.cipher});

  factory EnableBiometricRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EnableBiometricRequestModelFromJson(json);

  @JsonKey(name: 'CipherText')
  final String cipher;

  Map<String, dynamic> toJson() => _$EnableBiometricRequestModelToJson(this);
}
