import 'package:flutter/material.dart';
import 'package:throtl/core/utils/themes/pallete.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.background,
  cardColor: AppColors.cardBackground,
  primaryColor: AppColors.iconHighlight,

  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.iconHighlight,
    brightness: Brightness.dark,
  ).copyWith(
    surface: AppColors.cardBackground,
    primary: AppColors.iconHighlight,
    secondary: AppColors.iconTertiary,
    onPrimary: AppColors.headline,
    onSecondary: AppColors.headline,
    surfaceVariant: AppColors.background,
    onSurface: AppColors.headline,
  ),


  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.iconHighlight,
      foregroundColor: AppColors.headline,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    ),
  ),

  iconTheme: IconThemeData(
    color: AppColors.iconMain,
    size: 24,
  ),
);
