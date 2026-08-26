import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/logout/logout_model.dart';

part 'logout_response_model.g.dart';

@JsonSerializable()
class LogoutResponseModel extends BaseResponseModel<LogoutModel> {
  const LogoutResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LogoutResponseModelToJson(this);
}
