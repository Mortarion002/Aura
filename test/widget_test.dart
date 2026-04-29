import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aura/main.dart';
import 'package:aura/core/storage/prefs_provider.dart';

void main() {
  testWidgets('AuraApp smoke test — boots without crashing', (WidgetTester tester) async {
    // Set up SharedPreferences for test
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
        child: const AuraApp(),
      ),
    );

    // Splash screen should render the AURA title
    expect(find.text('A'), findsOneWidget);

    // Let the splash animation and navigation run
    await tester.pumpAndSettle(const Duration(seconds: 4));
  });
}
