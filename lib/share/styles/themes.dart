import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: black,
  brightness: Brightness.dark,
  textTheme: textTheme,
  elevatedButtonTheme: elevatedButtonThemeData,
  appBarTheme: appBarTheme,
);

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: black,
  elevation: 0,
);

TextTheme textTheme = TextTheme(
  headline1: textStyle1,
  headline2: textStyle1,
  headline3: textStyle1,
  headline4: textStyle1,
  headline5: textStyle1,
  headline6: textStyle1,
  bodyText1: textStyle3,
  bodyText2: textStyle3,
  caption: textStyle3,
  overline: textStyle3,
  button: textStyle4.copyWith(
    fontWeight: semiBold,
    letterSpacing: 1.1,
  ),
);

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: blue,
    foregroundColor: gray,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    textStyle: TextStyle(
      fontWeight: semiBold,
      letterSpacing: 1.1,
    ),
  ),
);
