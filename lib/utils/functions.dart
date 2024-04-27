import 'package:flutter/material.dart';
import 'package:mes_tchams/utils/app_colors.dart';

String truncateText(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}

bool isMobileScreenContext(BuildContext context){
  Size screenSize=MediaQuery.of(context).size;
  double width=screenSize.width;
  return width<=MediaQueryBreakPoints.smallScreenMaxWidth;
}

String normalize(String input) {
  return input.characters.map((char) {

  }).join();
}
