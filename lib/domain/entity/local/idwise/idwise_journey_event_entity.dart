import 'package:sayarti_mobile/domain/entity/local/idwise/idwise_journey_status.dart';

class IdwiseJourneyEventEntity {
  const IdwiseJourneyEventEntity({
    required this.status,
    required this.referenceNo,
    this.data,
  });

  final IdwiseJourneyStatus status;
  final String referenceNo;
  final dynamic data;
}