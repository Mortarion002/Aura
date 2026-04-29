import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aura/main.dart';

void main() {
  testWidgets('App starts smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: AuraApp()));
    await tester.pumpAndSettle();

    // Verify that the splash screen or app shell shows 'AURA'
    expect(find.text('AURA'), findsWidgets);
  });
}
