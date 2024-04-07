import 'package:flutter/material.dart'; 

const textColor = Color(0xFF11181c);
const backgroundColor = Color(0xFFebf1f5);
const primaryColor = Color(0xFF23475c);
const primaryFgColor = Color(0xFFebf1f5);
const secondaryColor = Color(0xFF79b7d8);
const secondaryFgColor = Color(0xFF11181c);
const accentColor = Color(0xFF2480b2);
const accentFgColor = Color(0xFFd0dbe2);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  background: backgroundColor,
  onBackground: textColor,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.light == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);

const textColorDk = Color(0xFFe3eaee);
const backgroundColorDk = Color(0xFF0a1014);
const primaryColorDk = Color(0xFFa3c7dc);
const primaryFgColorDk = Color(0xFF0a1014);
const secondaryColorDk = Color(0xFF276586);
const secondaryFgColorDk = Color(0xFFe3eaee);
const accentColorDk = Color(0xFF4da9db);
const accentFgColorDk = Color(0xFF131b20);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  background: backgroundColorDk,
  onBackground: textColorDk,
  primary: primaryColorDk,
  onPrimary: primaryFgColorDk,
  secondary: secondaryColorDk,
  onSecondary: secondaryFgColorDk,
  tertiary: accentColorDk,
  onTertiary: accentFgColorDk,
  surface: backgroundColorDk,
  onSurface: textColorDk,
  error: Brightness.dark == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);
