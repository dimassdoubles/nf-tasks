import 'package:flutter/material.dart';
import 'colors.dart';

import 'text_styles.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: black,
  brightness: Brightness.dark,
  textTheme: textTheme,
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
  button: textStyle4,
);
