import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/registration_content_entity.dart';

part 'registration_content_model.g.dart';

@JsonSerializable()
class RegistrationContentModel
    extends BaseTransformResponseModel<RegistrationContentEntity> {
  const RegistrationContentModel({
    required this.email,
    required this.verificationRequired,
  });

  final String email;
  final bool verificationRequired;

  factory RegistrationContentModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationContentModelToJson(this);

  @override
  RegistrationContentEntity toEntity() => RegistrationContentEntity(
    email: email,
    verificationRequired: verificationRequired,
  );
}
