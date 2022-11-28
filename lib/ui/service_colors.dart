// ignore_for_file: annotate_overrides
import 'package:flutter/material.dart';

@immutable
class ServiceColors extends ThemeExtension<ServiceColors> {
  const ServiceColors({
    required this.primary,
    required this.primaryLight,
    required this.backgroundGrey,
    required this.disableGrey,
    required this.borderGrey,
    required this.dividerGrey,
    required this.darkBackground,
    required this.shadowGrey,
    required this.textBlack,
    required this.textRed,
    required this.textBlue,
    required this.textYellow,
    required this.textOrange,
    required this.textOrangeLight,
    required this.buttonTextGrey,
    required this.secondaryTextGrey,
    required this.disableTextGrey,
    required this.buttonOrange,
    required this.buttonPrimary,
    required this.buttonRed,
    required this.buttonYellow,
    required this.buttonGrey,
    required this.buttonLightGrey,
    required this.buttonBlue,
    required this.buttonBorderGrey,
    required this.wrongRed,
    required this.wrongRedLight,
    required this.rightBlue,
    required this.rightBlueLight,
    required this.progressBlue,
    required this.progressRed,
    required this.progressViolet,
    required this.kakaoLabel,
    required this.kakaoBackground,
    required this.googleLabel,
    required this.googleBackground,
    required this.appleLabel,
    required this.appleBackground,
    required this.black,
    required this.white,
  });

  /// Primary Colors
  final Color? primary;
  final Color? primaryLight;

  /// Grey Color?s
  final Color? backgroundGrey;
  final Color? disableGrey;
  final Color? borderGrey;
  final Color? dividerGrey;
  final Color? darkBackground;
  final Color? shadowGrey;

  /// Text Color?s
  final Color? textBlack;
  final Color? textRed;
  final Color? textBlue;
  final Color? textYellow;
  final Color? textOrange;
  final Color? textOrangeLight;

  /// Bottom Text Color?s
  final Color? buttonTextGrey;
  final Color? secondaryTextGrey;
  final Color? disableTextGrey;

  /// Button Color?s
  final Color? buttonOrange;
  final Color? buttonPrimary;
  final Color? buttonRed;
  final Color? buttonYellow;
  final Color? buttonGrey;
  final Color? buttonLightGrey;
  final Color? buttonBlue;
  final Color? buttonBorderGrey;

  /// SolveColor?s
  final Color? wrongRed;
  final Color? wrongRedLight;
  final Color? rightBlue;
  final Color? rightBlueLight;

  /// Progress Color?s
  final Color? progressBlue;
  final Color? progressRed;
  final Color? progressViolet;

  /// Social Color?s
  final Color? kakaoLabel;
  final Color? kakaoBackground;
  final Color? googleLabel;
  final Color? googleBackground;
  final Color? appleLabel;
  final Color? appleBackground;

  /// Black & White
  final Color? black;
  final Color? white;

  @override
  ThemeExtension<ServiceColors> copyWith() {
    return ServiceColors(
      primary: primary,
      primaryLight: primaryLight,
      backgroundGrey: backgroundGrey,
      disableGrey: disableGrey,
      borderGrey: borderGrey,
      dividerGrey: dividerGrey,
      darkBackground: darkBackground,
      shadowGrey: shadowGrey,
      textBlack: textBlack,
      textRed: textRed,
      textBlue: textBlue,
      textYellow: textYellow,
      textOrange: textOrange,
      textOrangeLight: textOrangeLight,
      buttonTextGrey: buttonTextGrey,
      secondaryTextGrey: secondaryTextGrey,
      disableTextGrey: disableTextGrey,
      buttonOrange: buttonOrange,
      buttonPrimary: buttonPrimary,
      buttonRed: buttonRed,
      buttonYellow: buttonYellow,
      buttonGrey: buttonGrey,
      buttonLightGrey: buttonLightGrey,
      buttonBlue: buttonBlue,
      buttonBorderGrey: buttonBorderGrey,
      wrongRed: wrongRed,
      wrongRedLight: wrongRedLight,
      rightBlue: rightBlue,
      rightBlueLight: rightBlueLight,
      progressBlue: progressBlue,
      progressRed: progressRed,
      progressViolet: progressViolet,
      kakaoLabel: kakaoLabel,
      kakaoBackground: kakaoBackground,
      googleLabel: googleLabel,
      googleBackground: googleBackground,
      appleLabel: appleLabel,
      appleBackground: appleBackground,
      black: black,
      white: white,
    );
  }

  @override
  ThemeExtension<ServiceColors> lerp(
      covariant ThemeExtension<ServiceColors>? other, double t) {
    if (other is! ServiceColors) {
      return this;
    }
    return ServiceColors(
      primary: Color.lerp(primary, other.primary, t),
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t),
      backgroundGrey: Color.lerp(backgroundGrey, other.backgroundGrey, t),
      disableGrey: Color.lerp(disableGrey, other.disableGrey, t),
      borderGrey: Color.lerp(borderGrey, other.borderGrey, t),
      dividerGrey: Color.lerp(dividerGrey, other.dividerGrey, t),
      darkBackground: Color.lerp(darkBackground, other.darkBackground, t),
      shadowGrey: Color.lerp(shadowGrey, other.shadowGrey, t),
      textBlack: Color.lerp(textBlack, other.textBlack, t),
      textRed: Color.lerp(textRed, other.textRed, t),
      textBlue: Color.lerp(textBlue, other.textBlue, t),
      textYellow: Color.lerp(textYellow, other.textYellow, t),
      textOrange: Color.lerp(textOrange, other.textOrange, t),
      textOrangeLight: Color.lerp(textOrangeLight, other.textOrangeLight, t),
      buttonTextGrey: Color.lerp(buttonTextGrey, other.buttonTextGrey, t),
      secondaryTextGrey:
          Color.lerp(secondaryTextGrey, other.secondaryTextGrey, t),
      disableTextGrey: Color.lerp(disableTextGrey, other.disableTextGrey, t),
      buttonOrange: Color.lerp(buttonOrange, other.buttonOrange, t),
      buttonPrimary: Color.lerp(buttonPrimary, other.buttonPrimary, t),
      buttonRed: Color.lerp(buttonRed, other.buttonRed, t),
      buttonYellow: Color.lerp(buttonYellow, other.buttonYellow, t),
      buttonGrey: Color.lerp(buttonGrey, other.buttonGrey, t),
      buttonLightGrey: Color.lerp(buttonLightGrey, other.buttonLightGrey, t),
      buttonBlue: Color.lerp(buttonBlue, other.buttonBlue, t),
      buttonBorderGrey: Color.lerp(buttonBorderGrey, other.buttonBorderGrey, t),
      wrongRed: Color.lerp(wrongRed, other.wrongRed, t),
      wrongRedLight: Color.lerp(wrongRedLight, other.wrongRedLight, t),
      rightBlue: Color.lerp(rightBlue, other.rightBlue, t),
      rightBlueLight: Color.lerp(rightBlueLight, other.rightBlueLight, t),
      progressBlue: Color.lerp(progressBlue, other.progressBlue, t),
      progressRed: Color.lerp(progressRed, other.progressRed, t),
      progressViolet: Color.lerp(progressViolet, other.progressViolet, t),
      kakaoLabel: Color.lerp(kakaoLabel, other.kakaoLabel, t),
      kakaoBackground: Color.lerp(kakaoBackground, other.kakaoBackground, t),
      googleLabel: Color.lerp(googleLabel, other.googleLabel, t),
      googleBackground: Color.lerp(googleBackground, other.googleBackground, t),
      appleLabel: Color.lerp(appleLabel, other.appleLabel, t),
      appleBackground: Color.lerp(appleBackground, other.appleBackground, t),
      black: Color.lerp(black, other.black, t),
      white: Color.lerp(white, other.white, t),
    );
  }
}