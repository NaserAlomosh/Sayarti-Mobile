import 'package:json_annotation/json_annotation.dart';
import 'package:sayarti_mobile/data/base/base_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/statistics/expense_statistics_model.dart';
part 'expense_statistics_response_model.g.dart';
@JsonSerializable()
class ExpenseStatisticsResponseModel extends BaseResponseModel<ExpenseStatisticsModel> {
 const ExpenseStatisticsResponseModel({required super.success, super.data, super.message, super.error});
 factory ExpenseStatisticsResponseModel.fromJson(Map<String,dynamic> json)=>_$ExpenseStatisticsResponseModelFromJson(json); Map<String,dynamic> toJson()=>_$ExpenseStatisticsResponseModelToJson(this);
}
