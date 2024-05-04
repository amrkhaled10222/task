import 'package:flutter/material.dart';
import 'package:ui/src/app_icon.dart';
import 'package:ui/ui.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.svgLeading,
    required this.titleText,
    this.color,
    this.onPressed,
    this.titleTextStyle,
    this.trailing,
    this.subtitle,
    this.textStyle,
    this.contentPadding,
    this.colorFilter,
    this.iconWidth,
    this.iconHeight,
  });
  final Color? color;
  final String? svgLeading;
  final Function()? onPressed;
  final String titleText;
  final TextStyle? titleTextStyle;
  final Widget? trailing;
  final Widget? subtitle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final ColorFilter? colorFilter;
  final double? iconWidth;
  final double? iconHeight;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: contentPadding,
      minLeadingWidth: 10,
      enableFeedback: true,
      leading: AppIcon(
        colorFilter: colorFilter,
        // color: Colors.,
        imageUrl: svgLeading,
        // width: 20,
        width: iconWidth,
        height: iconHeight,

        // height: 20,
      ),
      trailing: trailing,
      onTap: onPressed,
      title: AppText(text: titleText, textStyle: textStyle ?? context.textTheme.labelMedium),
      titleTextStyle: titleTextStyle,
      subtitle: subtitle,
    );
  }
}
