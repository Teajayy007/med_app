import 'package:flutter_test/flutter_test.dart';
import 'package:med_event_app/feature/event/domain/enum/med_type_model.dart';

void main() {
  test('MedName proair equals and type is rescue', () {
    expect(MedName.proair.name, equals('proair'));

    expect(MedName.proair.medType, equals('rescue'));
  });

  test('MedName symbicort equals and type is controller', () {
    expect(MedName.symbicort.name, equals('symbicort'));

    expect(MedName.symbicort.medType, equals('controller'));
  });
}
