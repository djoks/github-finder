import 'package:flutter/material.dart';

class Ellipsis extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;

  const Ellipsis({
    super.key,
    required this.text,
    this.style,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final TextPainter textPainter = TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: maxLines ?? 1,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final int lastVisibleCharacter = textPainter
            .getPositionForOffset(
                Offset(constraints.maxWidth, constraints.maxHeight))
            .offset;

        String result = text;
        if (lastVisibleCharacter < text.length) {
          result = '${text.substring(0, lastVisibleCharacter)}...';
        }

        return Text(
          result,
          style: style,
          maxLines: maxLines ?? 1,
          overflow: TextOverflow.clip,
        );
      },
    );
  }
}
