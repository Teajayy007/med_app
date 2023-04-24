import 'package:med_event_app/feature/event/domain/event_model.dart';
import 'package:med_event_app/feature/event/domain/enum/med_type_model.dart';

const jsonEventModel = <String, dynamic>{
  'uid': '51c685a4fb206520205902014ac3',
  'datetime': '2021-01-01T11:32:00.000Z',
  'medication': 'proair',
  'medicationtype': 'rescue',
  'id': 1
};
final eventModel = EventModel(
  id: 1,
  medicationtype: MedName.proair.medType,
  datetime: DateTime.parse('2021-01-01T11:32:00.000Z'),
  medication: MedName.proair.name,
  uid: '51c685a4fb206520205902014ac3',
);
