import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color backgroundColor = Color(0xFF17032C);
const Color primaryColor = Color(0xFFFE53BB);
const Color secondaryColor = Color(0xFF09FBD3);
const Color textColor = Colors.white;

class KampusTheme {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: backgroundColor,
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(displayColor: textColor, bodyColor: textColor),
        scaffoldBackgroundColor: backgroundColor);
  }
}
