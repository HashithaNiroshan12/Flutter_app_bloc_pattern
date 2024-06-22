import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      
    );
  }

  static ColorScheme get _colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff909cdf),
      onPrimary: Color(0xffFFFFFF),
      primaryContainer: Color(0xfff2f3fb),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff9c254d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xFF358661),
      tertiary: Color(0xffb6c2ff),
      tertiaryContainer: Color(0xffffffff),
      errorContainer: Color(0xfffcd8df),
      onErrorContainer: Color(0xff000000),
      surfaceVariant: Color(0xffeeeeee),
      outline: Color(0xff737373),
      outlineVariant: Color(0xffbfbfbf),
      inverseSurface: Color(0xff121212),
      surfaceTint: Color(0xff909cdf),
      error: Color(0xFF5e162e),
      onError: Color(0xFFf5e9ed),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xff000000),
      surface: Color(0xFFf4f5fc),
      onSurface: Color(0xFF0e1016),
    );
  }

  static TextTheme get _textTheme {
    const textTheme = TextTheme();

    final bodyFont = GoogleFonts.ibmPlexSansTextTheme(textTheme);
    final headingFont = GoogleFonts.syneMonoTextTheme(textTheme);

    return bodyFont.copyWith(
      displayLarge: headingFont.displayLarge,
      displayMedium: headingFont.displayMedium,
      displaySmall: headingFont.displaySmall,
      headlineLarge: headingFont.headlineLarge,
      headlineMedium: headingFont.headlineMedium,
      headlineSmall: headingFont.headlineSmall,
      bodyLarge: bodyFont.bodyLarge,
      bodyMedium: bodyFont.bodyMedium,
      bodySmall: bodyFont.bodySmall,
    );
  }

}