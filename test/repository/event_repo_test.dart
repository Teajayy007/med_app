import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:med_event_app/feature/event/data/repository/event_repo.dart';

void main() {
  test('event repository is a BaseEventRepo', () {
    final providerContainer = ProviderContainer();

    addTearDown(providerContainer.dispose);

    expect(
      providerContainer.read(eventRepoProvider),
      isA<BaseEventRepo>(),
    );
  });
}
