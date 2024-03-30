import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotstar/utils/colors.dart';

class MyTextStyles {
  static TextStyle headingStyle = GoogleFonts.getFont(
    'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: white,
  );
  static TextStyle headinglightStyle = GoogleFonts.getFont(
    'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: lightwhite,
  );
  static TextStyle catSelected = GoogleFonts.getFont(
    'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: lightwhite,
  );
  static TextStyle catDefault = GoogleFonts.getFont(
    'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: grey,
  );
  static TextStyle subtextStyle = const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w900,
      color: Color.fromRGBO(255, 215, 0, 0.5));
  static TextStyle addbutStyle = TextStyle(
    color: addColor,
    fontWeight: FontWeight.bold,
  );
   static TextStyle addbutStyleTwo = TextStyle(
    color: white,
    fontWeight: FontWeight.bold,
  );


  static TextStyle subheadingStyle = TextStyle(fontSize: 12, color: grey);
  static TextStyle loginStyle = TextStyle(fontSize: 12, color: gethelp);
  static TextStyle loginStyle1 = TextStyle(fontSize: 12, color: grey);
}
