import 'package:json_annotation/json_annotation.dart';

part 'get_identity_flow_details_request_model.g.dart';

@JsonSerializable()
class GetIdentityFlowDetailsRequestModel {
  const GetIdentityFlowDetailsRequestModel({required this.flowType});

  factory GetIdentityFlowDetailsRequestModel.fromJson(
    Map<String, dynamic> json,
  ) => _$GetIdentityFlowDetailsRequestModelFromJson(json);

  @JsonKey(name: 'flowType')
  final String flowType;

  Map<String, dynamic> toJson() =>
      _$GetIdentityFlowDetailsRequestModelToJson(this);
}
