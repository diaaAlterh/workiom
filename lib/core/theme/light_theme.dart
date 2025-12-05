import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_light_scheme.dart';
import 'text_theme.dart';

ThemeData buildLightTheme(BuildContext context) {
  final textTheme = buildTextTheme(context, color: Colors.black);
  return ThemeData.light().copyWith(
    platform: TargetPlatform.iOS,
    textTheme: textTheme,
    primaryColor: lightColorScheme.primary,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 16),
    ),
    dividerColor: lightColorScheme.outline,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: lightColorScheme.primary),
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: lightColorScheme.secondary,
      dividerColor: Colors.transparent,
      unselectedLabelStyle: textTheme.headlineSmall?.copyWith(
        color: Colors.white.withOpacity(.7),
        fontWeight: FontWeight.w600,
      ),
      labelStyle: textTheme.headlineSmall?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    colorScheme: lightColorScheme.copyWith(surface: lightColorScheme.surface),
  );
}
