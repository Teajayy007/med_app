import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_event_app/core/constants/colors.dart';

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColor.getMaterialColor(AppColor.primary),
      colorScheme: const ColorScheme.dark(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
        background: AppColor.black,
      ),
      scaffoldBackgroundColor: AppColor.black,
      appBarTheme: const AppBarTheme(
        elevation: 1,
        backgroundColor: AppColor.black,
      ),
    );
  }

  /// Light theme data of the app
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColor.getMaterialColor(AppColor.primary),
      colorScheme: const ColorScheme.light(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
      ),
    );
  }

  static const darkDefaultCupertinoTheme =
      CupertinoThemeData(brightness: Brightness.dark);

  final materialLightTheme = AppTheme.light;
  final materialDarkTheme = AppTheme.dark;

  static MaterialBasedCupertinoThemeData cupertinoDarkTheme =
      MaterialBasedCupertinoThemeData(
    materialTheme: AppTheme.dark.copyWith(
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.dark,
        barBackgroundColor: darkDefaultCupertinoTheme.barBackgroundColor,
        textTheme: CupertinoTextThemeData(
          primaryColor: AppColor.white,
          navActionTextStyle:
              darkDefaultCupertinoTheme.textTheme.navActionTextStyle.copyWith(
            color: AppColor.white,
          ),
          navLargeTitleTextStyle: darkDefaultCupertinoTheme
              .textTheme.navLargeTitleTextStyle
              .copyWith(color: AppColor.white),
        ),
      ),
    ),
  );
  static MaterialBasedCupertinoThemeData cupertinoLightTheme =
      MaterialBasedCupertinoThemeData(materialTheme: light);
}
