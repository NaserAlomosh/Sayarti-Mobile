import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/register/registration_content_model.dart';

class RegisterResponseModel extends BaseResponseModel<RegistrationContentModel> {
  const RegisterResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    final response = BaseResponseModel<RegistrationContentModel>.fromJson(
      json,
      (value) => RegistrationContentModel.fromJson(
        value as Map<String, dynamic>,
      ),
    );
    return RegisterResponseModel(
      success: response.success,
      data: response.data,
      message: response.message,
      error: response.error,
    );
  }
}
