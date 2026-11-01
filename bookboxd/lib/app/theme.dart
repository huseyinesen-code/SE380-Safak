import 'package:flutter/material.dart';

// All app colors live here so they are easy to change later.
class AppColors {
  static const Color background = Color(0xFF0E0E0E);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color primary = Color(0xFFFF7A1A);
  static const Color text = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFA3A3A3);

  // Placeholder book covers: lighter than surface so they stand out.
  static const Color cover = Color(0xFF2A2A2A);
}

class AppTheme {
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.background,

    // Most Material widgets pick their default colors from this scheme.
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: Colors.black, // Text and icons on top of orange.
      surface: AppColors.surface,
      onSurface: AppColors.text,
      onSurfaceVariant: AppColors.textSecondary,
    ),

    // Elevated buttons aren't orange by default, so we set them explicitly.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      type: BottomNavigationBarType.fixed, // Keeps all 4 labels visible.
      elevation: 0, // A shadow only looks like a black band on a dark app.
    ),
  );
}
