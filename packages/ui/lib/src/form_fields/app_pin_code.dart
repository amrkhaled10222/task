import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ui/ui.dart';

class AppPinCode extends StatelessWidget {
  const AppPinCode({
    this.controller,
    this.length = 6,
    this.onCompleted,
    this.errorMessage,
    super.key,
  });
  final Function(String)? onCompleted;
  final TextEditingController? controller;
  final int length;
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PinCodeTextField(
          appContext: context,
          length: length,
          onChanged: (value) {},
          onCompleted: onCompleted,
          controller: controller,
          keyboardType: TextInputType.number,
          backgroundColor: Colors.transparent,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: AppCorners.lgBorder,
            activeColor: context.customColorStyle?.text,
            activeFillColor: context.customColorStyle?.text,
            selectedColor: context.customColorStyle?.text,
            inactiveColor: context.customColorStyle?.text4,
            errorBorderColor: context.customColorStyle?.error,
            borderWidth: 1,
          ),
        ),
        AppText(
          text: errorMessage ?? '',
          textStyle: context.textTheme.bodySmall?.copyWith(color: context.customColorStyle?.error),
        )
      ],
    );
  }
}
