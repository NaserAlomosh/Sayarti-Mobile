import 'package:sayarti_mobile/domain/entity/local/idwise/idwise_journey_callbacks.dart';

class IdwiseStartJourneyRequestModel {
  const IdwiseStartJourneyRequestModel({
    required this.flowId,
    required this.applicationId,
    this.locale = '',
    this.referenceNo,
    this.extraApplicantDetails,
    this.callbacks,
  });

  final String flowId;
  final String applicationId;

  final String locale;

  final String? referenceNo;

  final Map<String, dynamic>? extraApplicantDetails;

  final IdwiseJourneyCallbacks? callbacks;
}
