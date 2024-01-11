import 'package:flutter/material.dart';

// //im importing this color scheme using material official website

// const lightColorScheme = ColorScheme(
//   brightness: Brightness.light,
//   primary: Color(0xFF910ED6),
//   onPrimary: Color(0xFFFFFFFF),
//   primaryContainer: Color(0xFFF4D9FF),
//   onPrimaryContainer: Color(0xFF30004B),
//   secondary: Color(0xFF4F44E2),
//   onSecondary: Color(0xFFFFFFFF),
//   secondaryContainer: Color(0xFFE3DFFF),
//   onSecondaryContainer: Color(0xFF100069),
//   tertiary: Color(0xFF842BD0),
//   onTertiary: Color(0xFFFFFFFF),
//   tertiaryContainer: Color(0xFFF0DBFF),
//   onTertiaryContainer: Color(0xFF2C0050),
//   error: Color(0xFFBA1A1A),
//   errorContainer: Color(0xFFFFDAD6),
//   onError: Color(0xFFFFFFFF),
//   onErrorContainer: Color(0xFF410002),
//   background: Color(0xFFFDFBFF),
//   onBackground: Color(0xFF001B3D),
//   surface: Color(0xFFFDFBFF),
//   onSurface: Color(0xFF001B3D),
//   surfaceVariant: Color(0xFFEADFEA),
//   onSurfaceVariant: Color(0xFF),
//   outline: Color(0xFF7D747E),
//   onInverseSurface: Color(0xFFECF0FF),
//   inverseSurface: Color(0xFF003062),
//   inversePrimary: Color(0xFFE5B4FF),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFF910ED6),
//   outlineVariant: Color(0xFFCEC3CE),
//   scrim: Color(0xFF000000),
// );

// const darkColorScheme = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(0xFFE5B4FF),
//   onPrimary: Color(0xFF4F0078),
//   primaryContainer: Color(0xFF7000A8),
//   onPrimaryContainer: Color(0xFFF4D9FF),
//   secondary: Color(0xFFC3C0FF),
//   onSecondary: Color(0xFF1F00A4),
//   secondaryContainer: Color(0xFF3522CB),
//   onSecondaryContainer: Color(0xFFE3DFFF),
//   tertiary: Color(0xFFDEB7FF),
//   onTertiary: Color(0xFF4A007F),
//   tertiaryContainer: Color(0xFF6900B2),
//   onTertiaryContainer: Color(0xFFF0DBFF),
//   error: Color(0xFFFFB4AB),
//   errorContainer: Color(0xFF93000A),
//   onError: Color(0xFF690005),
//   onErrorContainer: Color(0xFFFFDAD6),
//   background: Color(0xFF001B3D),
//   onBackground: Color(0xFFD6E3FF),
//   surface: Color(0xFF001B3D),
//   onSurface: Color(0xFFD6E3FF),
//   surfaceVariant: Color(0xFF4B444D),
//   onSurfaceVariant: Color(0xFFCEC3CE),
//   outline: Color(0xFF978E98),
//   onInverseSurface: Color(0xFF001B3D),
//   inverseSurface: Color(0xFFD6E3FF),
//   inversePrimary: Color(0xFF910ED6),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFFE5B4FF),
//   outlineVariant: Color(0xFF4B444D),
//   scrim: Color(0xFF000000),
// );

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  background: Color(0xFFefeef7),
  onBackground: Color(0xFF14121c),
  primary: Color(0xFF2a1f65),
  onPrimary: Color(0xFFefeef7),
  secondary: Color(0xFF8d79e6),
  onSecondary: Color(0xFF14121c),
  tertiary: Color(0xFF3813dd),
  onTertiary: Color(0xFFefeef7),
  surface: Color(0xFFefeef7),
  onSurface: Color(0xFF14121c),
  error: Brightness.light == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  background: Color(0xFF090811),
  onBackground: Color(0xFFe5e3ed),
  primary: Color(0xFFa59ae0),
  onPrimary: Color(0xFF090811),
  secondary: Color(0xFF2d1986),
  onSecondary: Color(0xFFe5e3ed),
  tertiary: Color(0xFF4722ec),
  onTertiary: Color(0xFFe5e3ed),
  surface: Color(0xFF090811),
  onSurface: Color(0xFFe5e3ed),
  error: Brightness.dark == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);
