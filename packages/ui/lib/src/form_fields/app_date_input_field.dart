import 'package:flutter/material.dart';

import 'app_input_text_field.dart';

enum AppDateInputFieldType { date, time }

class AppDateInputField extends StatelessWidget {
  const AppDateInputField({
    required this.labelText,
    this.controller,
    this.focusNode,
    this.validator,
    this.hintText,
    this.appDateInputFieldType = AppDateInputFieldType.date,
    this.autofocus = false,
    this.enabled = true,
    this.initialDate,
    this.firstDate,
    this.onChange,
  });
  final DateTime? initialDate;
  final DateTime? firstDate;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String labelText;
  final String? hintText;
  final bool autofocus;
  final bool enabled;
  final AppDateInputFieldType appDateInputFieldType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? () => handleOnTap(context) : null,
      child: IgnorePointer(
        child: AppTextInputField(
          labelText: labelText,
          focusNode: focusNode,
          autofocus: autofocus,
          enabled: enabled,
          maxLines: 1,
          hintText: hintText,
          readOnly: true,
          validator: validator,
          controller: controller,
          onChange: onChange,
        ),
      ),
    );
  }

  Future<void> handleOnTap(BuildContext context) async {
    String? timeText;

    if (appDateInputFieldType == AppDateInputFieldType.date) {
      final DateTime? time = await showDatePicker(
        context: context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: firstDate ?? DateTime.now(),
        lastDate: DateTime(2100),
      );
      if (time != null) timeText = time.toString();
    } else {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) timeText = time.format(context);
    }
    if (controller != null && timeText != null) {
      controller!.text = timeText.toString();
    }
    if (onChange != null && timeText != null) {
      onChange!(timeText.toString());
    }
  }
}
