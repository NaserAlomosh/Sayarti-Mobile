// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'general_statistics_response_model.dart';
GeneralStatisticsResponseModel _$GeneralStatisticsResponseModelFromJson(Map<String, dynamic> json) => GeneralStatisticsResponseModel(success: json['success'] as bool, data: json['data'] == null ? null : GeneralStatisticsModel.fromJson(json['data'] as Map<String, dynamic>), message: json['message'] as String?, error: json['error'] == null ? null : ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>));
Map<String, dynamic> _$GeneralStatisticsResponseModelToJson(GeneralStatisticsResponseModel instance) => <String, dynamic>{'success': instance.success, 'data': instance.data, 'message': instance.message, 'error': instance.error};
