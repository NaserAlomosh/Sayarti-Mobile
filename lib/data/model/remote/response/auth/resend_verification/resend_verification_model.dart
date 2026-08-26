import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/resend_verification_entity.dart';

part 'resend_verification_model.g.dart';

@JsonSerializable()
class ResendVerificationModel
    extends BaseTransformResponseModel<ResendVerificationEntity> {
  const ResendVerificationModel({required this.accepted});
  final bool accepted;

  factory ResendVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$ResendVerificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResendVerificationModelToJson(this);

  @override
  ResendVerificationEntity toEntity() =>
      ResendVerificationEntity(accepted: accepted);
}
