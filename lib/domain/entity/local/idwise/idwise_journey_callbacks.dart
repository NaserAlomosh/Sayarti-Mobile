import 'package:sayarti_mobile/domain/entity/local/idwise/idwise_journey_event_entity.dart';

typedef IdwiseJourneyEventCallback =
    void Function(IdwiseJourneyEventEntity event);

typedef IdwiseJourneyErrorCallback = void Function(Object error);

class IdwiseJourneyCallbacks {
  const IdwiseJourneyCallbacks({
    this.onStarted,
    this.onCompleted,
    this.onResumed,
    this.onCancelled,
    this.onBlocked,
    this.onError,
  });

  final IdwiseJourneyEventCallback? onStarted;
  final IdwiseJourneyEventCallback? onCompleted;
  final IdwiseJourneyEventCallback? onResumed;
  final IdwiseJourneyEventCallback? onCancelled;
  final IdwiseJourneyEventCallback? onBlocked;

  final IdwiseJourneyErrorCallback? onError;
}
