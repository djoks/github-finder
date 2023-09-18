class Language {
  final String language;
  String? color;
  final int bytes;
  double percentage;

  Language(this.language,
      {this.color, required this.bytes, required this.percentage});

  @override
  String toString() {
    return 'LanguageInfo(language: $language, color: $color, bytes: $bytes, percentage: $percentage)';
  }
}
