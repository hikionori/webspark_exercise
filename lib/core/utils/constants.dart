import 'package:flutter/material.dart';

class Constants {
  static RegExp urlRegExp = RegExp(
    r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$',
  );
  static const Color startCellColor = Color(0xFF64FFDA);
  static const Color endCellColor = Color(0xFF009688);
  static const Color pathCellColor = Color(0xFF4CAF50);
  static const Color defaultCellColor = Color(0xFFFFFFFF);
  static const Color grey = Color(0xE0E0E0FF);
  static const Color red = Color(0xE0FF0000);
  static const Color black = Color(0xFF000000);
}
