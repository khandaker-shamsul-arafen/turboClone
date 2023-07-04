import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  static const Color text = Colors.white;
  static const Color text2 = Colors.black;
  static const Color background = Color.fromARGB(255, 38, 38, 39);
  static const Color background2 = Color.fromRGBO(18, 18, 18, 0.7);
  static const Color primaryColor = Color.fromRGBO(18, 18, 18, 1);
  static final Color border = Colors.grey.withOpacity(0.5);
  static const Color bottomNavigationBackground = Color.fromARGB(255, 11, 3, 3);
  static const Color selected = Colors.redAccent;
  static final Color parentBackground = HexColor('F0F0F0');
  static final Color navbarColor = HexColor('020129');
  static final Color navbarSelectedColor = HexColor('F10625');
  static final Color gradientEnd = HexColor('343353');
  static final Color gradientStart = HexColor('020129');
  static final Color dateContainerColor = HexColor('3E3E55');
  static final Color fixtureContainerBackground = HexColor('EBEBF1');
  static final Color overviewBackgroundColor = HexColor('E8E8E8');
}
