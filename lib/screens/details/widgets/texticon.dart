import 'package:flutter/material.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:hotstar/utils/styles.dart';

class DynamicIconTextWidget extends StatelessWidget {
  final IconData iconData;
  final String text;

  const DynamicIconTextWidget({
    super.key,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            color: grey,
            size: 20,
          ),
        ),
        Text(
          text,
          style: MyTextStyles.detailedOptions,
        ),
      ],
    );
  }
}
