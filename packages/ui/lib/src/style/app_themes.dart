import 'package:flutter/material.dart';
import 'package:ui/src/style/custom_color.dart';
import '../../ui.dart';

abstract class AppThemes {
  static const _textColor = Color(0xFF4E4E74);
  static const _textMedColor = Color(0xff8C8C8C);
  static const _primaryColor = Color(0xFF89181A);
  static const _borderColor = Color(0xFFE4E4E4);
  static final _disableColor = Color(0xFFBFBDD1).withOpacity(0.1);
  static const _errorColor = Color(0xFFFF1414);
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Montserrat',
    primaryColor: _primaryColor,

    primaryColorDark: Color(0xff027688),
    primaryColorLight: const Color(0xFFCCF0DC),
    secondaryHeaderColor: _primaryColor,
    cardColor: const Color(0xFFFDF5ED),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: AppCorners.xl3gRadius,
                topRight: AppCorners.xl3gRadius))),
    hoverColor: const Color(0xFFF5F4FA),
    // hoverColor: const Color(0xFFEEFFF5),
    disabledColor: const Color(0xFFBFBDD1),
    inputDecorationTheme: InputDecorationTheme(
      // fillColor: Color.fromARGB(255, 243, 243, 243),
      fillColor: _disableColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: _disableColor),
        borderRadius: AppCorners.medBorder,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: _disableColor),
        borderRadius: AppCorners.medBorder,
      ),
      border: OutlineInputBorder(
        borderSide:  BorderSide(color: _disableColor),
        borderRadius: AppCorners.medBorder,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: _errorColor),
        borderRadius: AppCorners.medBorder,
      ),
    ),
    scaffoldBackgroundColor: Color(0xffF8F9F9),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _primaryColor,
      onPrimary: const Color(0xFFCCF0DC),
      secondary: _primaryColor,
      onSecondary: _primaryColor,
      error: _errorColor,
      onError: _errorColor,
      background: Colors.white,
      onBackground: Colors.white,
      surface: _borderColor,
      onSurface: _borderColor,
    ),
    cardTheme: CardTheme(color: Color(0xffFFFFFF)),
    appBarTheme: AppBarTheme(
      // color: p,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 4,
    ),
    extensions: {
      CustomColorStyle(
        primary: _primaryColor,
        primary2: Color.fromARGB(255, 95, 168, 200),
        primary3: Color.fromARGB(255, 82, 209, 135),
        //secondary
        secondary: const Color(0xffFFC100),
        secondary2: Color.fromARGB(255, 162, 209, 215),
        secondary3: const Color(0xffFFFCF2),
        secondary4: Color(0xffFEFCFA),
        // card
        card1_1: const Color(0xffF5F6F6),
        card1_2: const Color(0xffFDF5ED),
        card2_1: const Color(0xffDFF0F0),
        card2_2: const Color(0xffF0F8F8),
        card3_1: const Color(0xffF7DCDB),
        card3_2: const Color(0xffFCF1F0),
        card4_1: const Color(0xffE3E7F7),
        card4_2: const Color(0xffF5F7FC),
        //text
        text: _textColor,
        text2: _textMedColor,
        text3: const Color(0xFF9492B2),
        text4: const Color(0xFFBFBDD1),
        //neutral
        neutral1_1: const Color(0xffF8D7DB),
        neutral1_2: const Color(0xffFCEFF0),
        neutral2_1: const Color(0xffF2F1FA),
        neutral2_2: const Color(0xffF8F8FC),

        //semantics
        semantics: const Color(0xffDA3949),
        semantics2: const Color(0xffEBEDED),
        background: const Color(0xffF8F9F9),
        //others
        error: _errorColor,
        success: Colors.green,

        disable: const Color(0xFF94A3B8),
        border: const Color(0xFFF2F1FA),
        white: Colors.white,
        transparent: Colors.transparent,
      )
    },
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Color(0xffFFFFFF),
        indicatorColor: _primaryColor,
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: Colors.white);
          }
          return IconThemeData(color: Colors.grey);
        }),
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _primaryColor);
            }
            return TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey);
          },
        )),

    //text Theme
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: _textColor),
      headlineMedium: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: _textColor),
      headlineSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: _textColor),
      labelLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: _textColor),
      labelMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: _textColor),
      labelSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: _textColor),
      bodyLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: _textMedColor),
      bodyMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: _textMedColor),
      bodySmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: _textMedColor),
      titleMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w700, color: _textMedColor),
      displayLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      displayMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      displaySmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    ),
  );
}
