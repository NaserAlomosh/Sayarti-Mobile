import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/resend_verification_content_entity.dart';

part 'resend_verification_content_model.g.dart';

@JsonSerializable()
class ResendVerificationContentModel
    extends BaseTransformResponseModel<ResendVerificationContentEntity> {
  const ResendVerificationContentModel({required this.accepted});

  final bool accepted;

  factory ResendVerificationContentModel.fromJson(Map<String, dynamic> json) =>
      _$ResendVerificationContentModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ResendVerificationContentModelToJson(this);

  @override
  ResendVerificationContentEntity toEntity() =>
      ResendVerificationContentEntity(accepted: accepted);
}
