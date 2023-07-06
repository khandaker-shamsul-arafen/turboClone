import 'package:flutter/material.dart';

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    final path = Path();
    path.lineTo(0.1 * size.width, 0);
    path.lineTo(0, size.height);
    path.lineTo(0.9 * size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0.1 * size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw false;
  }
}

class DropDownClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    final path = Path();
    path.lineTo(0.12 * size.width, 0);
    path.lineTo(0, 0.05 * size.height);
    path.lineTo(0.0 * size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0.12 * size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
