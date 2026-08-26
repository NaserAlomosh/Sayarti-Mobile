import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/register/resend_verification_content_model.dart';

class ResendVerificationResponseModel
    extends BaseResponseModel<ResendVerificationContentModel> {
  const ResendVerificationResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory ResendVerificationResponseModel.fromJson(Map<String, dynamic> json) {
    final response = BaseResponseModel<ResendVerificationContentModel>.fromJson(
      json,
      (value) => ResendVerificationContentModel.fromJson(
        value as Map<String, dynamic>,
      ),
    );
    return ResendVerificationResponseModel(
      success: response.success,
      data: response.data,
      message: response.message,
      error: response.error,
    );
  }
}
