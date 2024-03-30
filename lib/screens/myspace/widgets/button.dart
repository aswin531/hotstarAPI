import 'package:flutter/material.dart';
import 'package:hotstar/utils/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Gradient? gradient;
  final Color? textColor;

  MyButton({
    required this.text,
    required this.onPressed,
    this.color,
    this.gradient,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          color: primary,
          //  gradient: blueGradient
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
