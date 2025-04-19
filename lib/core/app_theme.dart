import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 카카오 기본 노랑 & 검정
  static const Color kakaoYellow = Color(0xFFFEE500);
  static const Color bubbleMe = Color(0xFFFFF176);      // 내 버블
  static const Color bubbleOther = Color(0xFFF0F0F0);   // 상대 버블

  static ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: kakaoYellow,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: kakaoYellow,
        foregroundColor: Colors.black,
      ),
      textTheme: GoogleFonts.pretendardTextTheme(
        const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
      ),
    );
  }
}
