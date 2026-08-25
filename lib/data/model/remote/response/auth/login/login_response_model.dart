import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/login/login_content_model.dart';

class LoginResponseModel extends BaseResponseModel<LoginContentModel> {
  const LoginResponseModel({required super.success, super.data, super.message, super.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final response = BaseResponseModel<LoginContentModel>.fromJson(
      json,
      (value) => LoginContentModel.fromJson(value as Map<String, dynamic>),
    );
    return LoginResponseModel(
      success: response.success,
      data: response.data,
      message: response.message,
      error: response.error,
    );
  }
}
