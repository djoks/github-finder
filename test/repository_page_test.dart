import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_finder/models/repository.dart';
import 'package:github_finder/pages/repository_page.dart';
import 'package:github_finder/providers/repository_provider.dart';
import 'package:github_finder/providers/theme_provider.dart';
import 'package:github_finder/services/http_service.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  testWidgets('Renders RepositoryPage without errors',
      (WidgetTester tester) async {
    // Create a mock HttpService
    final mockHttpService = MockHttpService();
    // Create a mock RepositoryProvider
    final repositoryProvider = RepositoryProvider(mockHttpService);

    // Create a fake Repository object
    final Repository repository = Repository(
      id: 1,
      name: 'TestRepo',
      description: 'Test Description',
      private: false,
      stargazersCount: 10,
    );

    // Build the RepositoryPage widget
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<RepositoryProvider>.value(
              value: repositoryProvider),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        child: ChangeNotifierProvider<RepositoryProvider>(
          create: (context) => repositoryProvider,
          child: MaterialApp(
            home: RepositoryPage(repository: repository),
          ),
        ),
      ),
    );

    // Verify if the page renders without errors
    expect(find.byType(RepositoryPage), findsOneWidget);

    // Verify if the header row is present
    expect(find.byKey(const Key('HeaderRow')), findsOneWidget);

    // Verify if the TabBar is present
    expect(find.byType(TabBar), findsOneWidget);
  });
}
