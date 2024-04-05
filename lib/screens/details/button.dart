import 'package:flutter/material.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:hotstar/utils/styles.dart';

class DetailedButton extends StatelessWidget {
  const DetailedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: white,
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.play_arrow,
              color: black,
            ),
            Text(
              "Subscribe to Watch",
              style: MyTextStyles.detailedStyle,
            ),
          ],
        ),
      ),
    );
  }
}
