import 'package:flutter/material.dart';
import 'package:hotstar/utils/styles.dart';

class ContentSection extends StatelessWidget {
  final String title;
  final double itemHeight;
  final Widget Function(BuildContext, int) itemBuilder;

  const ContentSection({
    super.key,
    required this.title,
    required this.itemHeight,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: MyTextStyles.headingStyle,
        ),
        SizedBox(
          height: itemHeight,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 12,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
