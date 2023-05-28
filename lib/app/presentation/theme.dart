import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color backgroundColor = Color(0xFF1a0136);
const Color primaryColor = Color.fromARGB(255, 173, 0, 104);
const Color secondaryColor = Color(0xFF09FBD3);
const Color textColor = Colors.white;
const Color tabItemPillColor = Color.fromARGB(255, 3, 4, 46);
const Color bottomNavBackgroundColor = Color.fromARGB(255, 0, 2, 32);
const Color mutedTextColor = Color.fromARGB(146, 255, 255, 255);

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
