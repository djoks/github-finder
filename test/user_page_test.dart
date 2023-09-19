import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_finder/models/user_details.dart';
import 'package:github_finder/pages/user_page.dart';
import 'package:github_finder/providers/theme_provider.dart';
import 'package:github_finder/services/http_service.dart';
import 'package:provider/provider.dart';
import 'package:github_finder/providers/user_provider.dart';
import 'package:mockito/mockito.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  testWidgets('Renders UserPage without errors', (WidgetTester tester) async {
    // Create a mock UserDetails object
    UserDetails mockUserDetails = UserDetails(
      login: 'testUser',
      name: 'Test User',
      avatarUrl: 'https://example.com/avatar.png',
      bio: 'This is a test bio',
      followers: 10,
      following: 5,
      location: 'Test Location',
    );

// Create a mock HttpService
    final mockHttpService = MockHttpService();
    // Create a mock UserProvider
    final userProvider = UserProvider(mockHttpService);

    // Build the RepositoryPage widget
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>.value(value: userProvider),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        child: ChangeNotifierProvider<UserProvider>(
          create: (context) => userProvider,
          child: MaterialApp(
            home: UserPage(
              userDetails: mockUserDetails,
            ),
          ),
        ),
      ),
    );

    // Verify if the profile image is displayed
    expect(find.byType(CachedNetworkImage), findsOneWidget);

    // Verify if the profile details are displayed
    expect(find.text('Test User'), findsOneWidget);
    expect(find.text('This is a test bio'), findsOneWidget);

    // Verify if the 'Repositories' tab is displayed
    expect(find.text('Repositories'), findsOneWidget);
  });
}
