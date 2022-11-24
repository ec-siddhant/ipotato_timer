import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class _AppColors {
  static const Color materialthemesyslightprimary = Color(0xff006782);
  static const Color materialthemesyslightonprimary = Color(0xffffffff);
  static const Color materialthemesyslightprimarycontainer = Color(0xffb6eaff);
  static const Color materialthemesyslightonprimarycontainer =
      Color(0xff001f2a);
  static const Color materialthemesyslightsecondary = Color(0xff216c2e);
  static const Color materialthemesyslightonsecondary = Color(0xffffffff);
  static const Color materialthemesyslightonsecondarycontainer =
      Color(0xff002106);
  static const Color materialthemesyslighttertiary = Color(0xff5b5b7d);
  static const Color materialthemesyslightontertiary = Color(0xffffffff);
  static const Color materialthemesyslightontertiarycontainer =
      Color(0xff181837);
  static const Color materialthemesyslighterror = Color(0xffba1b1b);
  static const Color materialthemesyslightonerror = Color(0xffffffff);
  static const Color materialthemesyslightbackground = Color(0xfffbfcfe);
  static const Color materialthemesyslightonbackground = Color(0xff191c1e);
  static const Color materialthemesyslightsurface = Color(0xfffbfcfe);
  static const Color materialthemesyslightonsurface = Color(0xff191c1e);
  static const Color materialthemesysdarkprimary = Color(0xff5fd4fd);
  static const Color materialthemesysdarkonprimary = Color(0xff003545);
  static const Color materialthemesysdarkprimarycontainer = Color(0xff004d62);
  static const Color materialthemesysdarkonprimarycontainer = Color(0xffb6eaff);
  static const Color materialthemesysdarksecondary = Color(0xff8bd88d);
  static const Color materialthemesysdarkonsecondary = Color(0xff00390c);
  static const Color materialthemesysdarkonsecondarycontainer =
      Color(0xffa7f5a7);
  static const Color materialthemesysdarktertiary = Color(0xffc4c3ea);
  static const Color materialthemesysdarkontertiary = Color(0xff2d2d4d);
  static const Color materialthemesysdarkontertiarycontainer =
      Color(0xffe1dfff);
  static const Color materialthemesysdarkerror = Color(0xffffb4a9);
  static const Color materialthemesysdarkonerror = Color(0xff680003);
  static const Color materialthemesysdarkbackground = Color(0xff191c1e);
  static const Color materialthemesysdarkonbackground = Color(0xffe1e3e5);
  static const Color materialthemesysdarksurface = Color(0xff191c1e);
  static const Color materialthemesysdarkonsurface = Color(0xffe1e3e5);
  static const Color materialthemereadonlylightwhite = Color(0xffffffff);
  static const Color materialthemesysdarkinverseprimary = Color(0xff006782);
  static const Color materialthemesyslightinverseprimary = Color(0xff006782);

}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  final _appBarTheme =
       AppBarTheme(backgroundColor: _AppColors.materialthemesyslightsecondary);

  ThemeData buildLightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        appBarTheme: _appBarTheme,
        colorScheme: _lightColorScheme,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: _AppColors.materialthemereadonlylightwhite,
        primaryColor: _AppColors.materialthemesyslightprimary,
        textTheme: _customTextTheme);
  }

  ThemeData buildDarkTheme() {
    return ThemeData(
        appBarTheme: _appBarTheme,
        scaffoldBackgroundColor: _AppColors.materialthemereadonlylightwhite,
        brightness: Brightness.dark,
        colorScheme: _darkColorScheme,
        fontFamily: 'Roboto',
        primaryColor: _AppColors.materialthemesysdarkprimary,
        textTheme: _customTextTheme);
  }
}

final TextTheme _customTextTheme = Typography().englishLike.copyWith(
      headlineLarge: const TextStyles().materialthemeheadlinelarge,
      headlineMedium: const TextStyles().materialthemeheadlinemedium,
      headlineSmall: const TextStyles().materialthemeheadlinesmall,
      displayLarge: const TextStyles().materialthemedisplaylarge,
      displayMedium: const TextStyles().materialthemedisplaymedium,
      displaySmall: const TextStyles().materialthemedisplaysmall,
      titleLarge: const TextStyles().materialthemetitlelarge,
      titleMedium: const TextStyles().materialthemetitlemedium,
      titleSmall: const TextStyles().materialthemetitlesmall,
      bodyLarge: const TextStyles().materialthemebodylarge,
      bodyMedium: const TextStyles().materialthemebodymedium,
      bodySmall: const TextStyles().materialthemebodysmall,
      labelLarge: const TextStyles().materialthemelabellarge,
      labelMedium: const TextStyles().materialthemelabelmedium,
      labelSmall: const TextStyles().materialthemelabelsmall,
    );

const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    background: _AppColors.materialthemesyslightbackground,
    error: _AppColors.materialthemesyslighterror,
    inversePrimary:
        _AppColors.materialthemesyslightinverseprimary,
    onPrimary: _AppColors.materialthemesyslightonprimary,
    primaryContainer: _AppColors.materialthemesyslightprimarycontainer,
    onPrimaryContainer: _AppColors.materialthemesyslightonprimarycontainer,
    onSecondary: _AppColors.materialthemesyslightonsecondary,
    onSecondaryContainer: _AppColors.materialthemesyslightonsecondarycontainer,
    onSurface: _AppColors.materialthemesyslightonsurface,
    onBackground: _AppColors.materialthemesyslightonbackground,
    onError: _AppColors.materialthemesyslightonerror,
    primary: _AppColors.materialthemesyslightprimary,
    tertiary: _AppColors.materialthemesyslighttertiary,
    secondary: _AppColors.materialthemesyslightsecondary,
    surface: _AppColors.materialthemesyslightsurface,
    onTertiary: _AppColors.materialthemesyslightontertiary,
    onTertiaryContainer: _AppColors.materialthemesyslightontertiarycontainer);

const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    background: _AppColors.materialthemesysdarkbackground,
    error: _AppColors.materialthemesysdarkerror,
    inversePrimary:
        _AppColors.materialthemesysdarkinverseprimary,
    onPrimary: _AppColors.materialthemesysdarkonprimary,
    primaryContainer: _AppColors.materialthemesysdarkprimarycontainer,
    onPrimaryContainer: _AppColors.materialthemesysdarkonprimarycontainer,
    onSecondary: _AppColors.materialthemesysdarkonsecondary,
    onSecondaryContainer: _AppColors.materialthemesysdarkonsecondarycontainer,
    onSurface: _AppColors.materialthemesysdarkonsurface,
    onBackground: _AppColors.materialthemesysdarkonbackground,
    onError: _AppColors.materialthemesysdarkonerror,
    primary: _AppColors.materialthemesysdarkprimary,
    tertiary: _AppColors.materialthemesysdarktertiary,
    secondary: _AppColors.materialthemesysdarksecondary,
    surface: _AppColors.materialthemesysdarksurface,
    onTertiary: _AppColors.materialthemesysdarkontertiary,
    onTertiaryContainer: _AppColors.materialthemesysdarkontertiarycontainer);

class TextStyles {
  const TextStyles();

  TextStyle get materialthemedisplay1 => const TextStyle(
        fontSize: 64,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 76 / 64,
        letterSpacing: -0.5,
      );

  TextStyle get materialthemedisplay2 => const TextStyle(
        fontSize: 57,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 64 / 57,
        letterSpacing: -0.25,
      );

  TextStyle get materialthemedisplay3 => const TextStyle(
        fontSize: 45,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 52 / 45,
        letterSpacing: 0,
      );

  TextStyle get materialthemeheadline1 => const TextStyle(
        fontSize: 36,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 44 / 36,
        letterSpacing: 0,
      );

  TextStyle get materialthemeheadline2 => const TextStyle(
        fontSize: 32,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 40 / 32,
        letterSpacing: 0,
      );

  TextStyle get materialthemeheadline3 => const TextStyle(
        fontSize: 28,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 36 / 28,
        letterSpacing: 0,
      );

  TextStyle get materialthemeheadline4 => const TextStyle(
        fontSize: 24,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 32 / 24,
        letterSpacing: 0,
      );

  TextStyle get materialthemeheadline5 => const TextStyle(
        fontSize: 22,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 28 / 22,
        letterSpacing: 0,
      );

  TextStyle get materialthemeheadline6 => const TextStyle(
        fontSize: 18,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 24 / 18,
        letterSpacing: 0,
      );

  TextStyle get materialthemesubhead1 => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: 0.1,
      );

  TextStyle get materialthemesubhead2 => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  TextStyle get materialthemebutton => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  TextStyle get materialthemebody1 => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        letterSpacing: 0.5,
      );

  TextStyle get materialthemebody2 => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        letterSpacing: 0.25,
      );

  TextStyle get materialthemecaption => const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        letterSpacing: 0.4,
      );

  TextStyle get materialthemeoverline => const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        letterSpacing: 0.5,
      );

  TextStyle get materialthemelabelSmall => const TextStyle(
        fontSize: 11,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 16 / 11,
        letterSpacing: 0.5,
      );

  TextStyle get materialthemedisplaylarge => const TextStyle(
        fontSize: 57,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 64 / 57,
        letterSpacing: -0.25,
      );

  TextStyle get materialthemedisplaymedium => const TextStyle(
        fontSize: 45,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 52 / 45,
        letterSpacing: 0,
      );

  TextStyle get materialthemedisplaysmall => const TextStyle(
        fontSize: 36,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 44 / 36,
        letterSpacing: 0,
      );

  TextStyle get materialthemeheadlinelarge => const TextStyle(
        fontSize: 32,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: _AppColors.materialthemesyslightonsecondary,
        height: 40 / 32,
        letterSpacing: 0,
      );

  TextStyle get materialthemeheadlinemedium => const TextStyle(
        fontSize: 28,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 36 / 28,
        letterSpacing: 0,
      );

  TextStyle get materialthemeheadlinesmall => const TextStyle(
        fontSize: 24,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 32 / 24,
        letterSpacing: 0,
      );

  TextStyle get materialthemetitlelarge => const TextStyle(
        fontSize: 22,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 28 / 22,
        letterSpacing: 0,
      );

  TextStyle get materialthemetitlemedium => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: 0.1,
      );

  TextStyle get materialthemetitlesmall => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  TextStyle get materialthemelabellarge => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  TextStyle get materialthemelabelmedium => const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        letterSpacing: 0.5,
      );

  TextStyle get materialthemelabelsmall => const TextStyle(
        fontSize: 11,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 16 / 11,
        letterSpacing: 0.5,
      );

  TextStyle get materialthemebodylarge => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        letterSpacing: 0.5,
      );

  TextStyle get materialthemebodymedium => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        letterSpacing: 0.25,
      );

  TextStyle get materialthemebodysmall => const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        letterSpacing: 0.4,
      );
}
