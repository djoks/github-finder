import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_finder/utils/get_language_color.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final TestDefaultBinaryMessengerBinding binding =
      TestDefaultBinaryMessengerBinding.instance;

  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/path_provider');

  group('getLanguageColor', () {
    setUp(() {
      binding.defaultBinaryMessenger.setMockMethodCallHandler(channel,
          (MethodCall methodCall) async {
        return '../assets/github-colors.json';
      });
    });

    tearDown(() {
      binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
    });

    test('returns correct color for a valid language key', () async {
      final color = await getLanguageColor('Dart');
      expect(color, '#00B4AB');
    });

    test('throws an exception for an invalid language key', () async {
      expect(() => getLanguageColor('InvalidKey'), throwsException);
    });
  });
}
