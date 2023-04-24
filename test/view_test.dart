import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:med_event_app/feature/event/data/repository/event_repo.dart';
import 'package:med_event_app/feature/event/ui/widget/widgets.dart';
import 'package:med_event_app/main.dart';
import 'mocks.dart';

void main() {
  testWidgets('Main Event View Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(
        overrides: [eventRepoProvider.overrideWithValue(MockEventRepository())],
        child: const MyApp()));

    // Verify that our screen starts in a loading state
    expect(find.byType(PlatformCircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    // Verify that a single event is rendered
    expect(find.byType(EventListTile), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that a dialog is displayed.
    expect(find.byType(DialogAlertWidget), findsOneWidget);

    // Verify that a dialog is displayed.
    expect(find.byKey(const Key('cancel')), findsOneWidget);
  });
}
