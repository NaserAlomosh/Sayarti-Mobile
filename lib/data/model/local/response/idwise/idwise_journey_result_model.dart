import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/local/idwise/idwise_journey_result_entity.dart';
import 'package:sayarti_mobile/domain/entity/local/idwise/idwise_journey_status.dart';

class IdwiseJourneyResultModel
    extends BaseTransformResponseModel<IdwiseJourneyResultEntity> {
  const IdwiseJourneyResultModel({
    required this.status,
    required this.referenceNo,
    this.data,
  });

  final IdwiseJourneyStatus status;
  final String referenceNo;
  final dynamic data;

  @override
  IdwiseJourneyResultEntity toEntity() {
    return IdwiseJourneyResultEntity(
      status: status,
      referenceNo: referenceNo,
      data: data,
    );
  }
}
