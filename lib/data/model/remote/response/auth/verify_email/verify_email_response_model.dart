import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/login/login_content_model.dart';

part 'verify_email_response_model.g.dart';

@JsonSerializable()
class VerifyEmailResponseModel extends BaseResponseModel<LoginContentModel> {
  const VerifyEmailResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory VerifyEmailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEmailResponseModelToJson(this);
}
