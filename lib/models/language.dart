class Language {
  final String? language;
  String? color;
  final int? bytes;
  double? percentage;

  Language(this.language, {this.color, this.bytes, this.percentage});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Language &&
        other.language == language &&
        other.color == color &&
        other.bytes == bytes &&
        other.percentage == percentage;
  }

  @override
  int get hashCode {
    return language.hashCode ^
        color.hashCode ^
        bytes.hashCode ^
        percentage.hashCode;
  }

  @override
  String toString() {
    return 'LanguageInfo(language: $language, color: $color, bytes: $bytes, percentage: $percentage)';
  }
}
