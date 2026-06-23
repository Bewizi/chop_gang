import 'package:chop_gang/core/theme/app_text_theme.dart';
import 'package:chop_gang/core/variables/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kTransparent,
    useMaterial3: true,
    textTheme: appTextTheme,
    colorScheme: const ColorScheme.light(
      primary: AppColors.kBlazeOrange500,
      secondary: AppColors.kCarbonBlack900,
      onSecondary: AppColors.kDarkSpruce800,
      onSurface: AppColors.kGoldenPollen400,
      error: AppColors.kFlagRed500,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kTransparent,
    useMaterial3: true,
    textTheme: appTextTheme,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.kBlazeOrange500,
      secondary: AppColors.kCarbonBlack900,
      onSecondary: AppColors.kDarkSpruce800,
      onSurface: AppColors.kGoldenPollen400,
      error: AppColors.kFlagRed500,
    ),
  );
}
