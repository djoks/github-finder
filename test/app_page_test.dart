import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ghfinder/pages/app_page.dart';
import 'package:ghfinder/providers/home_provider.dart';
import 'package:ghfinder/providers/theme_provider.dart';
import 'package:ghfinder/services/http_service.dart';
import 'package:ghfinder/widgets/tab_icons.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  testWidgets('AppPage renders correctly', (WidgetTester tester) async {
    // Create a mock HttpService
    final mockHttpService = MockHttpService();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => HomeProvider(mockHttpService)),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        child: const MaterialApp(
          home: AppPage(),
        ),
      ),
    );

    // Let the widgets render
    await tester.pumpAndSettle();

    // Expect to find 3 icons and 3 titles in the bottom navigation bar
    expect(find.byIcon(TabIcons.home), findsOneWidget);
    expect(find.byIcon(TabIcons.analytics), findsOneWidget);
    expect(find.byIcon(TabIcons.settings), findsOneWidget);

    expect(find.text('Analytics'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });
}
