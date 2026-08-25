// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_idwise_identity_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateIdwiseIdentityRequestModel _$ValidateIdwiseIdentityRequestModelFromJson(
  Map<String, dynamic> json,
) => ValidateIdwiseIdentityRequestModel(
  journeyId: json['journyId'] as String,
  flowType: json['flowType'] as String,
  refNo: json['RefNo'] as String,
);

Map<String, dynamic> _$ValidateIdwiseIdentityRequestModelToJson(
  ValidateIdwiseIdentityRequestModel instance,
) => <String, dynamic>{
  'journyId': instance.journeyId,
  'flowType': instance.flowType,
  'RefNo': instance.refNo,
};
