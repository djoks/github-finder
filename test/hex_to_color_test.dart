import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_finder/utils/hex_to_color.dart';

void main() {
  test('hexToColor should correctly convert a 7-character hex string', () {
    final color = hexToColor("#FFFFFF");
    expect(color, const Color(0xFFFFFFFF));
  });

  test('hexToColor should correctly convert a 9-character hex string', () {
    final color = hexToColor("#FFFFFFFF");
    expect(color, const Color(0xFFFFFFFF));
  });
}
