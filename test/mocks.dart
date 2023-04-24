import 'package:med_event_app/feature/event/data/repository/event_repo.dart';
import 'package:med_event_app/feature/event/domain/event_model.dart';
import 'data.dart';

/// A mocked implementation of Repository that returns a pre-defined list of [EventModel]
class MockEventRepository implements BaseEventRepo {
  @override
  EventModel createNewEvent(
      {required int id,
      required String medicationName,
      required DateTime timeStamp}) {
    return eventModel.copyWith(
        datetime: DateTime.now(), id: 0, uid: '23685a4fb206520205902014ac3');
  }

  @override
  Future<List<EventModel>> getEventList() async {
    return [eventModel];
  }
}
