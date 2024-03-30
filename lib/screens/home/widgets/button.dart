import 'package:flutter/material.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:hotstar/utils/styles.dart';

class ButtonClass extends StatelessWidget {
  final String buttonText;
  final String buttonText2;
  final Color buttonColor;
  final Color textColor;
  final Color? additionalColor;
  const ButtonClass(
      {super.key,
      required this.buttonText,
      required this.buttonText2,
      required this.buttonColor,
      required this.textColor,
      this.additionalColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
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
                  color: white,
                ),
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: MyTextStyles.addbutStyleTwo,
                ),
                Text(buttonText2,
                    textAlign: TextAlign.center,
                    style: MyTextStyles.addbutStyle),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Icon(
              Icons.add,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
