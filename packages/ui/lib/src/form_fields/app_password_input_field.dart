import 'package:flutter/material.dart';
import 'index.dart';

class AppPasswordInputField extends StatefulWidget {
  AppPasswordInputField({
    required this.labelText,
    this.controller,
    this.focusNode,
    this.hintText,
    this.errorMessage,
    this.validator,
    this.autofocus = false,
    this.onChange,
    this.contentPadding,
  });
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? errorMessage;
  String? labelText;
  final bool autofocus;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  EdgeInsets? contentPadding;
  @override
  _AppPasswordInputFieldState createState() => _AppPasswordInputFieldState();
}

class _AppPasswordInputFieldState extends State<AppPasswordInputField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextInputField(
      labelText: widget.labelText,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      maxLines: 1,
      // hintText: widget.hintText ?? "*************",
      validator: widget.validator,
      errorMessage: widget.errorMessage,
      controller: widget.controller,
      obscureText: obscureText,
      onChange: widget.onChange,
      contentPadding: widget.contentPadding,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            !obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            size: 24,
          ),
        ),
      ),
    );
  }
}
