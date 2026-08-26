import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/register/registration_content_model.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel extends BaseResponseModel<RegistrationContentModel> {
  const RegisterResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}
