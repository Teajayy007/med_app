import 'package:flutter_test/flutter_test.dart';
import 'package:med_event_app/feature/event/domain/event_model.dart';

import '../data.dart';

void main() {
  test('test EventModel fromJson', () {
    expect(EventModel.fromJson(jsonEventModel), equals(eventModel));
  });
}
