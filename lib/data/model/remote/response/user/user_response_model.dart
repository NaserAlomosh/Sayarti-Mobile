import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/login/user_model.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel extends BaseResponseModel<UserModel> {
  const UserResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
