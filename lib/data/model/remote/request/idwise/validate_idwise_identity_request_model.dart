import 'package:json_annotation/json_annotation.dart';

part 'validate_idwise_identity_request_model.g.dart';

@JsonSerializable()
class ValidateIdwiseIdentityRequestModel {
  const ValidateIdwiseIdentityRequestModel({
    required this.journeyId,
    required this.flowType,
    required this.refNo,
  });

  factory ValidateIdwiseIdentityRequestModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ValidateIdwiseIdentityRequestModelFromJson(json);

  /// Backend typo intentionally preserved.
  @JsonKey(name: 'journyId')
  final String journeyId;

  @JsonKey(name: 'flowType')
  final String flowType;

  @JsonKey(name: 'RefNo')
  final String refNo;

  Map<String, dynamic> toJson() =>
      _$ValidateIdwiseIdentityRequestModelToJson(this);
}
