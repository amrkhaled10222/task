import 'package:flutter/material.dart';
import 'package:ui/src/gen/assets.gen.dart';
import 'package:ui/ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.actions,
    this.centerWidget,
    this.bottomWidget,
    this.title,
    this.onTap,
    this.isLight=false,
    this.showBackButton = false,
  }) : super(key: key);

  List<Widget>? actions;
  Widget? centerWidget;
  final PreferredSizeWidget? bottomWidget;
  final String? title;
  bool showBackButton;
  bool isLight;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: showBackButton
            ? Padding(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () => onTap??Navigator.of(context).pop(),
                  child: AppSVGImage(
                    image: Assets.icons.backIcon,
                    color: !isLight
                        ? context.themeData.primaryColor
                        : Colors.white,
                  ),
                ),
              )
            : null,
        title: centerWidget ??
            AppText(
                text: title ?? '',
                textStyle: context.textTheme.headlineSmall?.copyWith(
                    color: !isLight
                        ? context.themeData.primaryColor
                        : Colors.white,
                    fontWeight: FontWeight.normal)),
        iconTheme: IconThemeData(color: context.themeData.primaryColor),
        actions: actions,
        bottom: bottomWidget,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(40);

}

// class CustomAppBar extends AppBar {
//   CustomAppBar(
//     BuildContext context, {
//     List<Widget>? actions,
//     Widget? centerWidget,
//     PreferredSizeWidget? bottomWidget,
//     String? title,
//     bool showBackButton = false,
//         bool isLight = false,
//         Function? onTap,
//   }) : super(
//             leading: showBackButton
//                 ? Padding(
//                   padding: EdgeInsets.all(16),
//                   child: InkWell(
//                     onTap: ()=>Navigator.of(context).pop,
//                     child: AppSVGImage(
//                       image: Assets.icons.backIcon,
//                       color: !isLight?context.themeData.primaryColor:Colors.white,
//                     ),
//                   ),
//                 )
//                 : null,
//             title: centerWidget ??
//                 AppText(
//                     text: title ?? '',
//                     textStyle: context.textTheme.headlineSmall?.copyWith(
//                         color: !isLight?context.themeData.primaryColor:Colors.white,
//                         fontWeight: FontWeight.normal)),
//             iconTheme: IconThemeData(color: context.themeData.primaryColor),
//             actions: actions,
//             bottom: bottomWidget,
//             elevation: 0,
//             centerTitle: true,
//             backgroundColor: Colors.white.withOpacity(0));
// }
