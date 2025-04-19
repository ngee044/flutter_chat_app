import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class KakaoAppBar extends AppBar {
  KakaoAppBar({
    super.key,
    required String titleText,
    List<Widget>? actions,
    bool center = false,
  }) : super(
          title: Text(titleText,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          actions: actions,
          backgroundColor: AppTheme.kakaoYellow,
          elevation: 0,
          centerTitle: center,
        );
}
