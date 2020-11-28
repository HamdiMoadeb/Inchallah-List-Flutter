import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveTokenSharedPref(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<String> getTokenSharedPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.getString('token');
}

double defaultRadius = 8.0;
double defaultBlurRadius = 5.0;
double defaultSpreadRadius = 2.0;

double textBoldSizeGlobal = 16;
double textPrimarySizeGlobal = 16;
double textSecondarySizeGlobal = 14;

double tabletBreakpointGlobal = 720.0;
double desktopBreakpointGlobal = 1200.0;

const textPrimaryColor = Color(0xFF2E3033);
const textSecondaryColor = Color(0xFF757575);

// Primary Text Style
TextStyle primaryTextStyle({
  int size,
  Color color,
  FontWeight weight = FontWeight.normal,
  String fontFamily,
  double letterSpacing,
  FontStyle fontStyle,
  double wordSpacing,
  TextDecoration decoration,
  TextDecorationStyle textDecorationStyle,
  TextBaseline textBaseline,
  Color decorationColor,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textPrimarySizeGlobal,
    color: color ?? textPrimaryColor,
    fontWeight: weight,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
  );
}

// Secondary Text Style
TextStyle secondaryTextStyle({
  int size,
  Color color,
  FontWeight weight = FontWeight.normal,
  String fontFamily,
  double letterSpacing,
  FontStyle fontStyle,
  double wordSpacing,
  TextDecoration decoration,
  TextDecorationStyle textDecorationStyle,
  TextBaseline textBaseline,
  Color decorationColor,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textSecondarySizeGlobal,
    color: color ?? textSecondaryColor,
    fontWeight: weight,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
  );
}

// Bold Text Style
TextStyle boldTextStyle({
  int size,
  Color color,
  FontWeight weight = FontWeight.bold,
  String fontFamily,
  double letterSpacing,
  FontStyle fontStyle,
  double wordSpacing,
  TextDecoration decoration,
  TextDecorationStyle textDecorationStyle,
  TextBaseline textBaseline,
  Color decorationColor,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textBoldSizeGlobal,
    color: color ?? textPrimaryColor,
    fontWeight: weight,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
  );
}
