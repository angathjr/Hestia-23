import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String NOIMAGE =
    'https://firebasestorage.googleapis.com/v0/b/hestia23.appspot.com/o/HomeScreenImages%2Fnoimage.png?alt=media&token=39752a3d-bb0f-483c-a388-9a7cde9e385a';

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

  static TextStyle font6 =
      GoogleFonts.georama(fontWeight: FontWeight.w600, color: Colors.white);

  static TextStyle mFont = GoogleFonts.montserrat(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle categoryFont = const TextStyle(fontFamily: 'Azonix');

  static TextStyle font7 = GoogleFonts.oxanium(fontWeight: FontWeight.w300);
  static Color primaryColor = const Color(0xffDEFD72);
  static Color primaryBg = const Color(0xff1A1A1A);
  static Color secondaryColor = const Color(0xffFFD730);
}

class ThemeColor {
  static const color1 = Color.fromRGBO(123, 126, 130, 1);
}

Widget primaryLoadingWidget = CupertinoActivityIndicator(
  radius: 16,
  color: Colors.white.withOpacity(0.5),
);

Widget secondaryLoadingWidget = CircularProgressIndicator(
  value: 12,
  color: Colors.white.withOpacity(0.5),
);
