import 'package:flutter/material.dart';

class CustomColorStyle extends ThemeExtension<CustomColorStyle> {
  Color? primary;
  Color? primary2;
  Color? primary3;

  Color? secondary;
  Color? secondary2;
  Color? secondary3;
  Color? secondary4;

  Color? card1_1;
  Color? card1_2;

  Color? card2_1;
  Color? card2_2;

  Color? card3_1;
  Color? card3_2;

  Color? card4_1;
  Color? card4_2;

  Color? text;
  Color? text2;
  Color? text3;
  Color? text4;

  Color? neutral1_1;
  Color? neutral1_2;
  Color? neutral2_1;
  Color? neutral2_2;

  Color? error;
  Color? disable;
  Color? border;
  Color? white;
  Color? transparent;

  Color? semantics;
  Color? semantics2;
  Color? success;
  Color? background;

  CustomColorStyle({
    required this.primary,
    required this.primary2,
    required this.primary3,
    required this.secondary,
    required this.secondary2,
    required this.secondary3,
    required this.secondary4,
    required this.card1_1,
    required this.card1_2,
    required this.card2_1,
    required this.card2_2,
    required this.card3_1,
    required this.card3_2,
    required this.card4_1,
    required this.card4_2,
    required this.text,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.neutral1_1,
    required this.neutral1_2,
    required this.neutral2_1,
    required this.neutral2_2,
    required this.error,
    required this.disable,
    required this.border,
    required this.white,
    required this.semantics,
    required this.semantics2,
    required this.success,
    required this.background,
    required this.transparent,
  });

  @override
  CustomColorStyle copyWith() {
    return CustomColorStyle(
      primary: primary,
      primary2: primary2,
      primary3: primary3,
      secondary: secondary,
      secondary2: secondary2,
      secondary3: secondary3,
      secondary4: secondary4,
      card1_1: card1_1,
      card1_2: card1_2,
      card2_1: card2_1,
      card2_2: card2_2,
      card3_1: card3_1,
      card3_2: card3_2,
      card4_1: card4_1,
      card4_2: card4_2,
      text: text,
      text2: text2,
      text3: text3,
      text4: text4,
      neutral1_1: neutral1_1,
      neutral1_2: neutral1_2,
      neutral2_1: neutral2_1,
      neutral2_2: neutral2_2,
      error: error,
      disable: disable,
      border: border,
      white: white,
      transparent: transparent,
      semantics: semantics,
      semantics2: semantics2,
      success: success,
      background: background,
    );
  }

  @override
  CustomColorStyle lerp(
    covariant ThemeExtension<CustomColorStyle>? other,
    double t,
  ) {
    if (other == null) return this;

    if (other is CustomColorStyle) {
      return CustomColorStyle(
        primary: Color.lerp(primary, other.primary, t),
        primary2: Color.lerp(primary2, other.primary2, t),
        primary3: Color.lerp(primary3, other.primary3, t),
        secondary: Color.lerp(secondary, other.secondary, t),
        secondary2: Color.lerp(secondary2, other.secondary2, t),
        secondary3: Color.lerp(secondary3, other.secondary3, t),
        secondary4: Color.lerp(secondary4, other.secondary4, t),
        card1_1: Color.lerp(card1_1, other.card1_1, t),
        card1_2: Color.lerp(card1_2, other.card1_2, t),
        card2_1: Color.lerp(card2_1, other.card2_1, t),
        card2_2: Color.lerp(card2_2, other.card2_2, t),
        card3_1: Color.lerp(card3_1, other.card3_1, t),
        card3_2: Color.lerp(card3_2, other.card3_2, t),
        card4_1: Color.lerp(card4_1, other.card4_1, t),
        card4_2: Color.lerp(card4_2, other.card4_2, t),
        text: Color.lerp(text, other.text, t),
        text2: Color.lerp(text2, other.text2, t),
        text3: Color.lerp(text3, other.text3, t),
        text4: Color.lerp(text4, other.text4, t),
        neutral1_1: Color.lerp(neutral1_1, other.neutral1_1, t),
        neutral1_2: Color.lerp(neutral1_2, other.neutral1_2, t),
        neutral2_1: Color.lerp(neutral2_1, other.neutral2_1, t),
        neutral2_2: Color.lerp(neutral2_2, other.neutral2_2, t),
        error: Color.lerp(error, other.error, t),
        disable: Color.lerp(disable, other.disable, t),
        border: Color.lerp(border, other.border, t),
        white: Color.lerp(white, other.white, t),
        transparent: Color.lerp(transparent, other.transparent, t),
        semantics: Color.lerp(semantics, other.semantics, t),
        semantics2: Color.lerp(semantics2, other.semantics2, t),
        success: Color.lerp(success, other.success, t),
        background: Color.lerp(background, other.background, t),
      );
    }

    return this;
  }
}
