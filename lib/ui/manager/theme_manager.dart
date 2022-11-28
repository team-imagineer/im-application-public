import 'package:flutter/material.dart';

import '../../data/source/secure_data.dart';
import '../service_colors.dart';

class ThemeManager extends ChangeNotifier {
  static const normalFilter = ColorFilter.matrix([
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);
  static const reverseFilter = ColorFilter.matrix([
    -1,
    0,
    0,
    0,
    255,
    0,
    -1,
    0,
    0,
    255,
    0,
    0,
    -1,
    0,
    255,
    0,
    0,
    0,
    1,
    0,
  ]);

  final SecureData _secureData;
  ThemeMode themeMode = ThemeMode.light;

  ThemeManager(this._secureData) {
    final result = _secureData.getValue("theme");
    result.then((value) {
      if (value != null) {
        themeMode = ThemeMode.values[int.parse(value)];
      }
    });
  }

  void setMode(ThemeMode newMode) {
    _secureData.setString("theme", newMode.index.toString());
    themeMode = newMode;
    notifyListeners();
  }

  void reverseMode() {
    setMode(themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }

  ThemeData getNowThemeData() {
    if (themeMode == ThemeMode.dark) {
      return ThemeManager.getDarkThemeData();
    }
    return ThemeManager.getLightThemeData();
  }

  static ThemeData getLightThemeData() {
    final lightTheme = ThemeData.light();
    return lightTheme.copyWith(
      canvasColor: Colors.transparent,
      extensions: _getLightThemeExtension(),
      textTheme: lightTheme.textTheme.apply(
        fontFamily: 'Pretendard',
      ),
      primaryTextTheme: lightTheme.textTheme.apply(
        fontFamily: 'Pretendard',
      ),
    );
  }

  static ThemeData getDarkThemeData() {
    final darkTheme = ThemeData.dark();
    return darkTheme.copyWith(
      canvasColor: Colors.transparent,
      extensions: _getDarkThemeExtension(),
      textTheme: darkTheme.textTheme.apply(
        fontFamily: 'Pretendard',
      ),
      primaryTextTheme: darkTheme.textTheme.apply(
        fontFamily: 'Pretendard',
      ),
    );
  }

  static List<ThemeExtension<dynamic>> _getLightThemeExtension() {
    return <ThemeExtension<dynamic>>[
      const ServiceColors(
        primary: Color(0xFFFFD175),
        primaryLight: Color(0xFFFFF0D6),
        backgroundGrey: Color(0xFFF9F9F9),
        disableGrey: Color(0xFFF3F3F3),
        borderGrey: Color(0xFFEFEFEF),
        dividerGrey: Color(0xFFE2E2E2),
        darkBackground: Color(0xFF333333),
        shadowGrey: Color(0xFFBCBCBC),
        textBlack: Color(0xFF333333),
        textRed: Color(0xFFFF4E4E),
        textBlue: Color(0xFF4E4EE3),
        textYellow: Color(0xFFE3B44E),
        textOrange: Color(0xFFFF7206),
        textOrangeLight: Color(0xFFE9990D),
        buttonTextGrey: Color(0xFF333333),
        secondaryTextGrey: Color(0xFF888B98),
        disableTextGrey: Color(0xFFC6C9D9),
        buttonOrange: Color(0xFFFFB73A),
        buttonPrimary: Color(0xFFFFC868),
        buttonRed: Color(0xFFFFE0E0),
        buttonYellow: Color(0xFFFFF6E0),
        buttonGrey: Color(0xFFD4D6DE),
        buttonLightGrey: Color(0xFFF7F7F7),
        buttonBlue: Color(0xFFE1E5F2),
        buttonBorderGrey: Color(0xFFD8D8D8),
        wrongRed: Color(0xFFFF7272),
        wrongRedLight: Color(0xFFFFE5E5),
        rightBlue: Color(0xFF5757F2),
        rightBlueLight: Color(0xFFEFEFFF),
        progressBlue: Color(0xFF85BFF2),
        progressRed: Color(0xFFEC6E7B),
        progressViolet: Color(0xFFA17FE6),
        kakaoLabel: Color(0xD9000000),
        kakaoBackground: Color(0xFFFEE500),
        googleLabel: Color(0xFF757575),
        googleBackground: Color(0xFFFFFFFF),
        appleLabel: Color(0xFFFFFFFF),
        appleBackground: Color(0xFF000000),
        black: Colors.black,
        white: Colors.white,
      )
    ];
  }

  static List<ThemeExtension<dynamic>> _getDarkThemeExtension() {
    return <ThemeExtension<dynamic>>[
      const ServiceColors(
        primary: Color(0xC29A7122),
        primaryLight: Color(0xBEFFE4B9),
        backgroundGrey: Color(0xFF1E1E1E),
        disableGrey: Color(0xB0656565),
        borderGrey: Color(0xB0EFEFEF),
        dividerGrey: Color(0xB0E2E2E2),
        darkBackground: Color(0xFF333333),
        shadowGrey: Color(0xFFBCBCBC),
        textBlack: Color(0xFFCCCCCC),
        textRed: Color(0xFF303030),
        textBlue: Color(0xFF303030),
        textYellow: Color(0xFF303030),
        textOrange: Color(0xFF303030),
        textOrangeLight: Color(0xFF303030),
        buttonTextGrey: Color(0xFF303030),
        secondaryTextGrey: Color(0xFF888B98),
        disableTextGrey: Color(0xFFC6C9D9),
        buttonOrange: Color(0xB0FFB73A),
        buttonPrimary: Color(0xB0FFC868),
        buttonRed: Color(0xB0FFE0E0),
        buttonYellow: Color(0xB0FFF6E0),
        buttonGrey: Color(0xBEB0BBC0),
        buttonLightGrey: Color(0xFF858585),
        buttonBlue: Color(0xB0E1E5F2),
        buttonBorderGrey: Color(0xB0646464),
        wrongRed: Color(0xFFFF4444),
        wrongRedLight: Color(0xFFA26D6D),
        rightBlue: Color(0xFF3939E8),
        rightBlueLight: Color(0xCAEFEFFF),
        progressBlue: Color(0xFF85BFF2),
        progressRed: Color(0xFFEC6E7B),
        progressViolet: Color(0xFFA17FE6),
        kakaoLabel: Color(0xD9000000),
        kakaoBackground: Color(0xFFFEE500),
        googleLabel: Color(0xFF757575),
        googleBackground: Color(0xFFFFFFFF),
        appleLabel: Color(0xFFFFFFFF),
        appleBackground: Color(0xFF000000),
        black: Color(0xFF070707),
        white: Color(0xFF070707),
      )
    ];
  }
}
