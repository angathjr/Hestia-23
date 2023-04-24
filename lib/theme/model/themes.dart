import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hestia_23/theme/controllers/theme_controller.dart';

class Themes {
  // FUTURE  THEME
  final ThemeController themeController = Get.find();
  final _box = GetStorage();
  final _key = 'theme';

  ThemeData get theme {
    switch (_loadThemeFromBox()) {
      case 0:
        return pastTheme;
      case 1:
        return presentTheme;
      case 2:
        return futureTheme;
      default:
        return presentTheme;
    }
  }

  AssetImage get backgroundImage {
    switch (_loadThemeFromBox()) {
      case 0:
        themeController.selectedIndex.value = 0;
        return const AssetImage(
          "assets/images/pastBg.png",
        );
      case 1:
        themeController.selectedIndex.value = 1;
        return const AssetImage(
          "assets/images/presentBg.png",
        );
      case 2:
        themeController.selectedIndex.value = 2;
        return const AssetImage(
          "assets/images/futureBg.png",
        );
      default:
        themeController.selectedIndex.value = 2;
        return const AssetImage(
          "assets/images/presentBg.png",
        );
    }
  }

  int _loadThemeFromBox() => _box.read(_key) ?? 2;

  _saveThemeToBox(int index) => _box.write(_key, index);

  void switchTheme(int index) async {
    await _saveThemeToBox(index);
    Get.changeTheme(theme);
    Get.forceAppUpdate();
    await Future.delayed(const Duration(milliseconds: 100));
    Get.back();
  }

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
    secondaryHeaderColor: const Color(0xffFFD730),
    canvasColor: const Color(0xff1A1A1A),
    cardColor: const Color(0xff1C1C1C),

    //text themes

    textTheme: TextTheme(
      headlineLarge: const TextStyle(
        fontFamily: 'Azonix',
      ),
      headlineMedium: const TextStyle(
        fontFamily: 'Geomanist',
      ),
      titleLarge: const TextStyle(fontFamily: 'Azonix'),
      titleMedium: const TextStyle(
        fontFamily: 'Azonix',
        fontWeight: FontWeight.w500,
        // color: Colors.white,
      ),
      titleSmall: const TextStyle(
        fontFamily: 'Azonix',
        fontWeight: FontWeight.w300,
      ),
      bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.w700),
      bodyMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
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
    primaryColor: const Color(0xffFFD730),
    canvasColor: const Color(0xff1A1A1A),
    cardColor: const Color(0xff1C1C1C),

    //text themes

    textTheme: TextTheme(
      headlineLarge: const TextStyle(
        fontFamily: 'Sandy',
      ),
      headlineMedium: const TextStyle(
        fontFamily: 'Geomanist',
      ),
      titleLarge: const TextStyle(fontFamily: 'Sandy'),
      titleMedium: const TextStyle(
        fontFamily: 'Sandy',
        fontWeight: FontWeight.w500,
        // color: Colors.white,
      ),
      titleSmall: const TextStyle(
        fontFamily: 'Sandy',
        fontWeight: FontWeight.w300,
      ),
      bodyLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w700, color: const Color(0xffDEFD72)),
      bodyMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.oxanium(fontWeight: FontWeight.w300),
    ),
  );

  //PAST THEME

  static final pastTheme = ThemeData.dark().copyWith(
    useMaterial3: true,

    //appbar

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      scrolledUnderElevation: 0,
    ),

    //styles

    scaffoldBackgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    primaryColor: const Color(0xffF7CD93),
    canvasColor: const Color(0xff1A1A1A),
    cardColor: const Color(0xff1A1A1A),

    //text themes

    textTheme: TextTheme(
      headlineLarge: const TextStyle(
        fontFamily: 'Gangof3',
      ),
      headlineMedium: const TextStyle(
        fontFamily: 'Geomanist',
      ),
      titleLarge: const TextStyle(fontFamily: 'Gangof3'),
      titleMedium: const TextStyle(
        fontFamily: 'Gangof3',
        fontWeight: FontWeight.w500,
        // color: Colors.white,
      ),
      titleSmall: const TextStyle(
        fontFamily: 'Gangof3',
        fontWeight: FontWeight.w300,
      ),
      bodyLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w700, color: const Color(0xffDEFD72)),
      bodyMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.oxanium(fontWeight: FontWeight.w300),
    ),
  );

  static TextStyle futureFont = const TextStyle(fontFamily: 'Azonix');
  static TextStyle pastFont = const TextStyle(fontFamily: 'Gangof3');
  static TextStyle presentFont = const TextStyle(fontFamily: 'Sandy');
}
