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

  static TextStyle font3 =font2.copyWith(
    fontWeight: FontWeight.w600,
  );

}
