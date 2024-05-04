import 'package:flutter/material.dart';
import '../ui.dart';

enum ButtonType {
  active,
  secondary,
  tertiary,
  text,
  disabled,
}

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    required this.type,
    this.textColor,
    this.onTap,
    this.padding,
    this.center = false,
    this.isLoading = false,
    this.isSmall = false,
    this.leadingIcon,
    this.leading,
    this.trailingIcon,
    this.trailing,
    this.textStyle,
    this.buttonColor,
    this.borderColor,
    this.margin,
  });
  final bool center;
  final String text;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final ButtonType type;
  final GestureTapCallback? onTap;
  final bool isLoading;
  final bool isSmall;
  final String? leadingIcon;
  final Widget? leading;
  final Widget? trailing;
  final String? trailingIcon;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    if (isLoading) return const AppLoading();
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: type != ButtonType.disabled ? onTap : null,
        child: Container(
            padding: padding ?? EdgeInsets.symmetric(vertical: isSmall ? 7 : 12, horizontal: isSmall ? 12 : 16),
            decoration: BoxDecoration(
              color: buttonColor ?? type.getFilledColor(context),
              borderRadius: AppCorners.medBorder,
              border: Border.all(color: borderColor ?? type.getBorderColor(context)),
            ),
            child: _buildLayout(context)),
      ),
    );
  }

  Widget _buildLayout(BuildContext context) {
    if (trailingIcon != null || leadingIcon != null || leading != null || trailing != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leadingIcon != null || leading != null) leading ?? _buildIcon(leadingIcon!),
          4.widthBox,
          _buildText(context),
          4.widthBox,
          if (trailingIcon != null || trailing != null) trailing ?? _buildIcon(trailingIcon!),
        ],
      );
    }
    return Center(
      child: _buildText(context),
    );
  }

  AppSVGImage _buildIcon(String icon) => AppSVGImage(
        image: icon,
        width: isSmall ? 16 : 20,
        height: isSmall ? 16 : 20,
      );

  AppText _buildText(BuildContext context) {
    return AppText(
      text: text,
      textAlign: center ? TextAlign.center : TextAlign.start,
      textStyle: getTextStyle(context),
    );
  }

  TextStyle getTextStyle(BuildContext context) {
    if (textStyle != null) return textStyle!;

    return isSmall
        ? context.textTheme.bodySmall!.copyWith(color: textColor ?? type.getTextColor(context))
        : context.textTheme.bodyMedium!.copyWith(color: textColor ?? type.getTextColor(context));
  }
}

extension ButtonTypeExtension on ButtonType {
  Color getFilledColor(BuildContext context) {
    switch (this) {
      case ButtonType.active:
        return context.themeData.primaryColor;
      case ButtonType.secondary:
        return Colors.transparent;
      case ButtonType.tertiary:
        return context.themeData.hoverColor;
      case ButtonType.text:
        return Colors.transparent;
      case ButtonType.disabled:
        return context.themeData.disabledColor;
    }
  }

  Color getBorderColor(BuildContext context) {
    switch (this) {
      case ButtonType.active:
        return context.themeData.primaryColor;
      case ButtonType.secondary:
        return context.themeData.primaryColor;
      case ButtonType.tertiary:
        return context.themeData.hoverColor;
      case ButtonType.text:
        return Colors.transparent;
      case ButtonType.disabled:
        return context.themeData.disabledColor;
    }
  }

  Color? getTextColor(BuildContext context) {
    switch (this) {
      case ButtonType.active:
        return context.themeData.colorScheme.background;
      case ButtonType.secondary:
        return context.themeData.primaryColor;
      case ButtonType.tertiary:
        return context.themeData.primaryColor;
      case ButtonType.text:
        return null;
      case ButtonType.disabled:
        return context.themeData.colorScheme.background;
    }
  }
}
