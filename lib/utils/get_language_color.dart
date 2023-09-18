import 'dart:convert';
import 'package:flutter/services.dart';

Future<String> getLanguageColor(String key) async {
  String jsonString = await rootBundle.loadString('assets/github-colors.json');
  Map<String, dynamic> jsonData = jsonDecode(jsonString);

  String? color = jsonData[key]?['color'];

  if (color != null) {
    return color;
  } else {
    throw Exception('Key not found');
  }
}
