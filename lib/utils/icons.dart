
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const String primaryIcon = "assets/images/Disney+ Hotstar.svg";
const String pIconBg = "assets/images/logobgremoved.png";
 IconData customIcon = FontAwesomeIcons.arrowTrendUp;
class CustomBottomNavigationBarItem {
  final IconData iconData;
  final String label;
  final Color iconColor;
  final Color backgroundColor;

  CustomBottomNavigationBarItem({
    required this.iconData,
    required this.label,
    this.iconColor = Colors.grey,
    this.backgroundColor = Colors.black,
  });
}