import 'package:flutter/material.dart';

class AppTheme {
  static const kakaoYellow = Color(0xFFFEE500);
  static const bubbleMe = Color(0xFFFFF176);
  static const bubbleOther = Color(0xFFF0F0F0);
  static const divider = Color(0xFFE0E0E0);

  static ThemeData theme() {
    return ThemeData(
      useMaterial3: false,
      fontFamily: 'Kakao',
      primaryColor: kakaoYellow,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: kakaoYellow,
        foregroundColor: Colors.black,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: 'Kakao',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      dividerColor: divider,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 15, color: Colors.black87),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kakaoYellow,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFFF7F7F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
