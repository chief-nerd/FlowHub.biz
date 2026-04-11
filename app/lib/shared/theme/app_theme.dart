import 'package:flutter/material.dart';

class AppTheme {
  static const _primaryColor = Color(0xFF3B82F6); // Action color

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        surface: Color(0xFFF3F4F6),
        surfaceContainerHighest: Color(0xFFE5E7EB),
        onSurface: Color(0xFF111827),
      ),
      scaffoldBackgroundColor: const Color(0xFFF3F4F6),
      dividerColor: const Color(0xFFD1D5DB),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: _primaryColor,
        surface: Color(0xFF111827),
        surfaceContainerHighest: Color(0xFF1F2937),
        onSurface: Color(0xFFF9FAFB),
      ),
      scaffoldBackgroundColor: const Color(0xFF111827),
      dividerColor: const Color(0xFF374151),
    );
  }
}
