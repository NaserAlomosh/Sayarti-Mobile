import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/dashboard/dashboard_model.dart';

part 'dashboard_response_model.g.dart';

@JsonSerializable()
class DashboardResponseModel extends BaseResponseModel<DashboardModel> {
  const DashboardResponseModel({
    required super.success,
    super.data,
    super.message,
    super.error,
  });

  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardResponseModelToJson(this);
}
