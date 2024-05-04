import 'package:flutter/material.dart';
import '../../ui.dart';

class AppTextInputField extends StatelessWidget {
  const AppTextInputField({
    this.labelText,
    this.focusNode,
    this.autofocus = false,
    this.hintText,
    this.controller,
    this.enabled = true,
    this.obscureText = false,
    this.validator,
    this.prefix,
    this.maxLines,
    this.onFieldSubmitted,
    this.minLines,
    this.style,
    this.suffixSvg,
    this.focusColor,
    this.suffix,
    this.suffixIcon,
    this.errorMessage,
    this.readOnly = false,
    this.expands = false,
    this.keyboardType = TextInputType.text,
    this.textAlignVertical,
    this.onChange,
    this.fillColor,
    this.contentPadding,
  });
  final Color? focusColor;
  final String? hintText;
  final String? errorMessage;
  final String? labelText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixSvg;
  final Widget? prefix;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final bool expands;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final bool obscureText;
  final TextStyle? style;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChange;
  final TextAlignVertical? textAlignVertical;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return buildAppFormField(context);
  }

  Widget buildAppFormField(BuildContext context) {
    return AppFormField(
      autofocus: autofocus,
      focusColor: focusColor,
      fillColor: fillColor,
      readOnly: readOnly,
      expands: expands,
      labelText: labelText,
      style: style,
      errorMessage: errorMessage,
      obscureText: obscureText,
      enabled: enabled,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      hintText: hintText,
      suffix: suffix,
      suffixIcon: _buildSuffixIcon(),
      prefix: prefix,
      controller: controller,
      focusNode: focusNode,
      textAlignVertical: textAlignVertical,
      onChanged: onChange,
      contentPadding: contentPadding,
    );
  }

  Widget? _buildSuffixIcon() {
    if (suffixIcon != null) return suffixIcon;
    if (suffixSvg != null) return AppSVGImage(image: suffixSvg!);

    return null;
  }
}

class AppFormField extends StatelessWidget {
  AppFormField({
    Key? key,
    this.autofocus = false,
    this.readOnly = false,
    this.expands = false,
    this.style,
    this.obscureText = false,
    this.enabled = true,
    this.validator,
    this.onFieldSubmitted,
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.decoration,
    this.focusColor,
    this.fillColor,
    this.hintText,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.suffixWidthConstraints = 30,
    this.prefixWidthConstraints = 30,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintStyle,
    this.contentPadding,
    this.onChanged,
    this.errorMessage,
    this.textAlignVertical,
  }) : super(key: key);
  final String? errorMessage;
  final String? labelText;
  final bool autofocus;
  final bool readOnly;
  final bool expands;
  final TextStyle? style;
  final bool obscureText;
  final bool enabled;
  final Color? focusColor;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final TextAlignVertical? textAlignVertical;
  final double suffixWidthConstraints;
  final double prefixWidthConstraints;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final String? hintText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  final InputBorder inputBorder = OutlineInputBorder(
    // borderSide: const BorderSide(width: 0),
    borderRadius: AppCorners.medBorder,
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
      autofocus: autofocus,
      readOnly: readOnly,
      expands: expands,
      style: style ?? context.textTheme.bodySmall,
      obscureText: obscureText,
      enabled: enabled,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      decoration: decoration ??
          InputDecoration(
            fillColor: fillColor ?? context.themeData.inputDecorationTheme.fillColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            enabledBorder: context.themeData.inputDecorationTheme.enabledBorder,
            border: context.themeData.inputDecorationTheme.border,
            focusedBorder: context.themeData.inputDecorationTheme.focusedBorder,
            errorBorder: context.themeData.inputDecorationTheme.errorBorder,
            errorText: errorMessage,
            hintText: hintText,
            hintStyle: hintStyle,
            suffix: suffix,
            label: labelText != null ? AppText(text: labelText!) : null,
            labelStyle: context.textTheme.bodySmall,
            errorMaxLines: 2,
            suffixIcon: suffixIcon,
            prefixIcon: prefix,
            // prefixIconConstraints: BoxConstraints(maxHeight: 24, maxWidth: 60),
            // suffixIconConstraints: BoxConstraints(maxHeight: 24, maxWidth: 60),
            alignLabelWithHint: true,
            // filled: true,
          ),
      controller: controller,
      focusNode: focusNode,
    );
  }
}
