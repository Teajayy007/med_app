import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_event_app/feature/event/data/network/api.dart';
import 'package:med_event_app/feature/event/domain/event_model.dart';
import 'package:med_event_app/feature/event/domain/enum/med_type_model.dart';
import 'package:med_event_app/utils/exceptions.dart';
import 'package:uuid/uuid.dart' show Uuid;

const _uuid = Uuid();

abstract class BaseEventRepo {
  Future<List<EventModel>> getEventList();

  EventModel createNewEvent(
      {required int id,
      required String medicationName,
      required DateTime timeStamp});
}

final eventRepoProvider =
    Provider<BaseEventRepo>((ref) => EventRepo(ref.watch(apiProvider)));

///[EventRepo] is an implementation of [BaseEventRepo]
///
///[getEventList] method returns a json body from an http request and decodes to [EventModel] list.
///[createNewEvent] requires a name, id and timestamp value in order to create a new [EventModel].
class EventRepo implements BaseEventRepo {
  final Api _api;
  EventRepo(this._api);

  @override
  Future<List<EventModel>> getEventList() async {
    try {
      final res = await _api.get('/propeller_mobile_assessment_data.json');
      final eventList = (res.data['events'] as List<dynamic>);
      if (eventList.isEmpty) {
        throw EmptyDataException();
      }
      return eventList
          .map<EventModel>(
            (elements) => EventModel.fromJson(elements as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  EventModel createNewEvent(
          {required int id,
          required String medicationName,
          required DateTime timeStamp}) =>
      EventModel(
          id: id,
          datetime: timeStamp,
          medication: medicationName,
          medicationtype: MedName.type(medicationName),
          uid: _uuid.v4());
}
