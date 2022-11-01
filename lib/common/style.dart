import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color.fromARGB(255, 255, 255, 255);
const Color onPrimary = Color.fromARGB(255, 255, 255, 255);
const Color secondaryColor = Color.fromARGB(255, 73, 73, 73);
const Color colorBackGround = Color.fromARGB(255, 185, 182, 169);

class ColorSelect {
  Color appBarColor = const Color.fromARGB(255, 249, 252, 229);
  Color color1 = const Color.fromARGB(255, 252, 248, 229);
  Color color2 = const Color.fromARGB(255, 225, 218, 203);
  Color color3 = const Color.fromARGB(255, 116, 114, 105);
  Color color4 = const Color.fromARGB(255, 90, 88, 79);
}

final TextTheme fontsTheme = TextTheme(
  headline1: GoogleFonts.lato(
      fontSize: 86, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.lato(
      fontSize: 53, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.lato(fontSize: 43, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.lato(
      fontSize: 30, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.lato(fontSize: 21, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.lato(
      fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.lato(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.lato(
      fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.montserrat(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.montserrat(
      fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.montserrat(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.montserrat(
      fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
