import 'package:flutter/material.dart';
import 'package:ui/src/gen/assets.gen.dart';
import 'package:ui/ui.dart';

class AppImageScaffold extends StatelessWidget {
  const AppImageScaffold({
    super.key,
    required this.body,
    required this.imgPath,
    this.showLanguage = false,
    this.onLanguageTapped,
    this.languageText,
  });
  final String? languageText;
  final Widget body;
  final String imgPath;
  final bool showLanguage;
  final Function()? onLanguageTapped;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: context.sw,
        height: context.sh * .50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: _buildBorder(),
        ),
        child: SafeArea(child: body),
      ),
      body: _buildImage(context),
    );
  }

  BorderRadius _buildBorder() {
    return BorderRadius.only(
      topLeft: AppCorners.xl3gRadius,
      topRight: AppCorners.xl3gRadius,
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.sw,
          height: context.sh * .55,
          child: Image.asset(imgPath, fit: BoxFit.fill),
        ),
        if (showLanguage)
          Positioned(
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppButton(
                onTap: onLanguageTapped,
                text: languageText ?? '',
                textColor: context.customColorStyle?.white,
                borderColor: context.customColorStyle?.white,
                type: ButtonType.secondary,
                isSmall: true,
                trailingIcon: Assets.icons.language,
              ),
            )),
          )
      ],
    );
  }
}
