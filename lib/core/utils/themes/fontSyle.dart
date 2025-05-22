import 'package:flutter/material.dart';
import 'package:throtl/core/utils/themes/pallete.dart';

class AppTextStyles {
  // Primary headline - big and bold
  static const TextStyle headline = TextStyle(
    fontFamily: 'Tommorrow',  // replace with your chosen font family
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.cardHeading, // your bright white
    letterSpacing: 1.2,
  );

  // Secondary headline / subtitles
  static const TextStyle subHeadline = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF94A1B2), // your muted blue-gray
    letterSpacing: 1.0,
  );

  // Body text - regular paragraph
  static const TextStyle body = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Color(0xFFB0B7C3), // lighter gray
    height: 1.5,
  );

  // Button text style
  static const TextStyle iconTextStyle = TextStyle(
    fontFamily: 'Tomorrow',
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.cardHeading, // purple highlight
    letterSpacing: 1.1,
  );

    static const TextStyle dashBordMainCardTextStyle = TextStyle(
    fontFamily: 'Poppins',  // replace with your chosen font family
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.cardHeading,
  );
}
