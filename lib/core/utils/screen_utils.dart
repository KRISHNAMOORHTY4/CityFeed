import 'package:flutter/material.dart';

class ScreenUtils {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static bool isMopile(BuildContext context) {
    
    return MediaQuery.of(context).size.width < 420;
  }
}
