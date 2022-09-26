// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rw_flutter_debugging_v2/main.dart';

void main() {
  testWidgets('Calculator adds smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the Sum is not displayed at first
    expect(find.text('Sum:'), findsNothing);

    // Find the TextFields
    final textField1 = find.byKey(const Key('txt_field_1'));
    final textField2 = find.byKey(const Key('txt_field_2'));
    // Fill the TextFields with values
    await tester.enterText(textField1, '10');
    await tester.enterText(textField2, '5');
    // Tap the Add Button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the sum has been displayed
    expect(find.text('Sum: 15.0'), findsOneWidget);
  });
}
