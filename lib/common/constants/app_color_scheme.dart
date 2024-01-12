import 'package:flutter/material.dart';

// //im importing this color scheme using realtimecolors.com

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
