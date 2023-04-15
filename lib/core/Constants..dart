import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FutTheme {
  static TextStyle font1 = const TextStyle(
    fontFamily: 'Geomanist',
    color: Colors.white,
  );

  static TextStyle font2 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );

  static TextStyle font3 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle font4 = font2.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle font5 = GoogleFonts.poppins(
      fontWeight: FontWeight.w700, color: const Color(0xffDEFD72));
}

class ThemeColor {
  static const color1 = Color.fromRGBO(123, 126, 130, 1);
  static TextStyle font4 = GoogleFonts.oxanium(
      fontWeight: FontWeight.w300, color: const Color(0xffBCBCBC));
}
