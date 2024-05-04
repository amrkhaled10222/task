import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:ui/src/dialogs/dialog_painter.dart';
import 'package:ui/ui.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({required this.dialogModel, super.key});
  final DialogModel dialogModel;

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
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                width: 80,
                height: 80,
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(color: dialogModel.iconBackColor, borderRadius: BorderRadius.circular(100)),
                  padding: EdgeInsets.all(4),
                  child: Center(
                    child: AppSVGImage(
                      image: dialogModel.image,
                      color: Colors.white,
                      boxFit: BoxFit.fill,
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
          60.heightBox,
          AppText(
            text: dialogModel.title,
            textStyle: context.textTheme.headlineMedium,
          ),
          12.heightBox,
          AppText(
            text: dialogModel.description,
            textStyle: context.textTheme.bodyLarge,
          ),
          12.heightBox,
          _buildActions(context),
          24.heightBox,
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      children: [
        if (dialogModel.dialogType == DialogType.action) ...[
          Expanded(
              flex: 2,
              child: AppButton(
                onTap: dialogModel.onSecondaryTapped ?? context.pop,
                text: dialogModel.secondaryText!,
                type: ButtonType.secondary,
                textStyle: context.textTheme.headlineSmall?.copyWith(color: context.customColorStyle?.text2),
                borderColor: dialogModel.secondaryButtonColor ?? context.customColorStyle?.text2,
              )),
          8.widthBox,
        ],
        Expanded(
          flex: 3,
          child: AppButton(
            onTap: dialogModel.onPrimaryTapped ?? context.pop,
            text: dialogModel.primaryText,
            type: ButtonType.active,
            buttonColor: dialogModel.primaryButtonColor ?? context.customColorStyle?.primary,
            borderColor: dialogModel.primaryButtonColor ?? context.customColorStyle?.primary,
            textStyle: context.textTheme.headlineSmall?.copyWith(color: context.customColorStyle?.white),
          ),
        ),
      ],
    );
  }
}
