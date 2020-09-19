import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = buildTheme();

final Color previewScreenBackground = Colors.white60;
final Color asoPrimary = Color(0xFFF30075);
final Color asoSecondary = Color(0xFFF30075);

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    textTheme: _buildDefaultTextTheme(base.textTheme),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: asoPrimary,
  );
}

TextTheme _buildDefaultTextTheme(TextTheme base) {
  final textTheme = GoogleFonts.latoTextTheme(base);
  return textTheme.copyWith(
    headline3: GoogleFonts.lato(
        textStyle: base.headline3,
        fontWeight: FontWeight.w900,
        color: asoPrimary
    ),
    headline4: GoogleFonts.lato(
        textStyle: base.headline4,
        fontWeight: FontWeight.w900,
        color: asoPrimary
    ),
    headline5: GoogleFonts.lato(
      textStyle: base.headline5,
      fontWeight: FontWeight.w700,
    ),
    headline6: GoogleFonts.lato(
      textStyle: base.headline6,
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 25.0,
    ),
    caption: GoogleFonts.lato(
      textStyle: base.caption,
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 18.0,
    ),
    bodyText1: GoogleFonts.lato(
      textStyle: base.bodyText1,
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  );
}
