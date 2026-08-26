import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/user/delete_user/delete_user_model.dart';

part 'delete_user_response_model.g.dart';

@JsonSerializable()
class DeleteUserResponseModel extends BaseResponseModel<DeleteUserModel> {
  const DeleteUserResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory DeleteUserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserResponseModelToJson(this);
}
