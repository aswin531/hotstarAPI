import 'package:flutter/material.dart';
import 'package:hotstar/utils/styles.dart';

class ContentSection extends StatelessWidget {
  final String title;
  final double itemHeight;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount; 

  const ContentSection({
    super.key,
    required this.title,
    required this.itemHeight,
    required this.itemBuilder,
    required this.itemCount, 
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
        const SizedBox(height: 10,),
        SizedBox(
          height: itemHeight,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: itemCount, 
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
