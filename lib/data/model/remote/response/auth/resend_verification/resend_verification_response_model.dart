import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/resend_verification/resend_verification_model.dart';

part 'resend_verification_response_model.g.dart';

@JsonSerializable()
class ResendVerificationResponseModel
    extends BaseResponseModel<ResendVerificationModel> {
  const ResendVerificationResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory ResendVerificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResendVerificationResponseModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ResendVerificationResponseModelToJson(this);
}
