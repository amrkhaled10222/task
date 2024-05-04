import 'package:flutter/material.dart';
import 'package:ui/src/dialogs/dialog_painter.dart';
import 'package:ui/src/gen/assets.gen.dart';
import 'package:ui/ui.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({required this.message, super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        // height: 400,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              heightFactor: 0,
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(80)),
                width: 80,
                height: 80,
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
                  padding: EdgeInsets.all(4),
                  child: Center(
                    child: AppSVGImage(
                      image: Assets.icons.warning,
                      width: 60,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomPaint(
                painter: DialogPainter(),
                child: Container(
                  // decoration: BoxDecoration(color: Colors.white),
                  child: _buildBody(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          80.heightBox,
          AppText(
            text: message,
            textStyle: context.textTheme.bodyLarge,
          ),
          32.heightBox,
          _buildActions(context),
          24.heightBox,
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: AppButton(
            onTap: context.pop,
            text: 'OK',
            type: ButtonType.active,
            buttonColor: context.customColorStyle?.primary,
            borderColor: context.customColorStyle?.primary,
            textStyle: context.textTheme.headlineSmall?.copyWith(color: context.customColorStyle?.white),
          ),
        ),
      ],
    );
  }
}
