import 'package:json_annotation/json_annotation.dart';
part 'update_mileage_request_model.g.dart';
@JsonSerializable()
class UpdateMileageRequestModel {
 const UpdateMileageRequestModel({required this.mileage}); final int mileage;
 factory UpdateMileageRequestModel.fromJson(Map<String,dynamic> json) => _$UpdateMileageRequestModelFromJson(json);
 Map<String,dynamic> toJson() => _$UpdateMileageRequestModelToJson(this);
}
