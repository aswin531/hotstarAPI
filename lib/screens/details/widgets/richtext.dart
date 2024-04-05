import 'package:flutter/material.dart';
import 'package:hotstar/utils/colors.dart';

class CustomText extends StatelessWidget {
  final List<TextSegment> segments;

  const CustomText({super.key, required this.segments});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: buildTextSpans(),
      ),
    );
  }

  List<TextSpan> buildTextSpans() {
    List<TextSpan> textSpans = [];

    for (int i = 0; i < segments.length; i++) {
      final segment = segments[i];
      textSpans.add(
        TextSpan(
          text: segment.text,
          style: TextStyle(
            color: segment.color,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      );
      if (i < segments.length - 1) {
        textSpans.add(
          TextSpan(
            text: ' | ',
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        );
      }
    }

    return textSpans;
  }
}

class TextSegment {
  final String text;
  final Color color;

  const TextSegment({required this.text, required this.color});
}
