import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {

  static ThemeData get theme {
    return ThemeData(
      colorScheme: const ColorScheme(
        primary: AppColors.primary,
        secondary: AppColors.textAccent,
        surface: AppColors.surface,
        onPrimary: AppColors.surface,
        onSecondary: Colors.white,
        onSurface: AppColors.textDark,
        error: Colors.red,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: AppColors.backgroundLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.surface,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        // For Account title, large bold text
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        // For InfoBanner text
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w900,
          color: AppColors.textAccent,
        ),
        // For MenuListItem text
        bodySmall: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
        // For SectionHeader text
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
          letterSpacing: 0.5,
        ),
        // For Login button text
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w900,
          color: AppColors.primary,
        ),
      ),

      // Icon theme
      iconTheme: const IconThemeData(
        color: AppColors.textDark,
        size: 24,
      ),

      // Divider theme
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),

      // Button theme (for ActionButton, assuming elevated button style)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}