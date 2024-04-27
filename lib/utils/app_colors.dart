// colors.dart

import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromRGBO(41, 148, 198, 1);
  static const Color primaryVariant = Colors.blue;
  static const Color whiteMilk = Color.fromRGBO(212, 212, 212, 1);
  static const Color surface = Colors.white;
  static const Color background = Colors.white;
  static const Color error = Colors.red;
  static const Color chatRailsBorder=Color.fromRGBO(196, 196, 196, 1);
  static const Color tileColor=Color.fromRGBO(50, 142, 137, 1);
  static const Color chatRailBgColor=tileColor;
}

class AppDecorations{
  static const borderStyle=Border(
    right: BorderSide(color: AppColors.chatRailsBorder,width: 1),
  );
}

class MediaQueryBreakPoints{
  static const  double smallScreenMaxWidth = 960;
}