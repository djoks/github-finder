import 'package:flutter/material.dart';

Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 7) {
    buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
  } else if (hexString.length == 9) {
    buffer.write(hexString.replaceFirst('#', ''));
  }
  return Color(int.parse(buffer.toString(), radix: 16));
}
