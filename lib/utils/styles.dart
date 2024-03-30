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
  static TextStyle subheadingStyle = TextStyle(fontSize: 12, color: grey);
  static TextStyle loginStyle = TextStyle(fontSize: 12, color: gethelp);
  static TextStyle loginStyle1 = TextStyle(fontSize: 12, color: grey);
}
