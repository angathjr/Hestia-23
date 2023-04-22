import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  // FUTURE  THEME

  static final futureTheme = ThemeData.dark().copyWith(
    useMaterial3: true,

    //appbar

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      scrolledUnderElevation: 0,
    ),

    //styles

    scaffoldBackgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    focusColor: Colors.grey,
    primaryColor: const Color(0xffDEFD72),
    cardColor: const Color(0xff1C1C1C),
    secondaryHeaderColor: const Color(0xff1A1A1A),

    //text themes

    textTheme: TextTheme(
      headlineMedium: const TextStyle(
        fontFamily: 'Geomanist',
      ),
      titleLarge: const TextStyle(fontFamily: 'Azonix'),
      titleMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        // color: Colors.white,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w300,
      ),
      bodyLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w700, color: const Color(0xffDEFD72)),
      bodyMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600,
      ),
      bodySmall: GoogleFonts.oxanium(fontWeight: FontWeight.w300),
      labelMedium: GoogleFonts.questrial(),
    ),
  );

  //PRESENT THEME

  static final presentTheme = ThemeData.dark().copyWith(
    useMaterial3: true,

    //appbar

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      scrolledUnderElevation: 0,
    ),

    //styles

    scaffoldBackgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    primaryColor: const Color(0xffD5BA95),
    secondaryHeaderColor: const Color(0xff731714),

    //text themes

    textTheme: TextTheme(
      headlineMedium: const TextStyle(
        fontFamily: 'Geomanist',
      ),
      titleLarge: const TextStyle(fontFamily: 'Sandy'),
      titleMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        // color: Colors.white,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w300,
      ),
      bodyLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w700, color: const Color(0xffDEFD72)),
      bodyMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600,
      ),
      bodySmall: GoogleFonts.oxanium(fontWeight: FontWeight.w300),
    ),
  );

  //
}
