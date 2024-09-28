import 'package:app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Mock languages data
    final Map<String, Map<String, String>> mockLanguages = {
      'en': {'select_language': 'Select Language'},
      'tel': {'select_language': 'Select Language'},// Add other mock translations if needed
    };

    // Build our app and trigger a frame.
  //  await tester.pumpWidget(MyApp(languages: mockLanguages));


    //for only test start
    await tester.pumpWidget(MyApp(RouteHelper :RouteHelper(), languages: mockLanguages,));
   // await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
