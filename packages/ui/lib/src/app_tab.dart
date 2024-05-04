import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AppTabs extends StatefulWidget {
  const AppTabs({
    super.key,
    required this.values,
    required this.disabledColor,
    this.initSelected = 0,
    required this.onPressed,
    this.isScrollable = false,
    this.isExpanded = false,
    this.itemsSpacing = 8,
  });
  final int initSelected;
  final List<String> values;
  final Color disabledColor;
  final Function(int selected) onPressed;
  final bool isScrollable;
  final bool isExpanded;
  final double itemsSpacing;
  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  // late TabController _controller;

  @override
  void initState() {
    selectedIndex = widget.initSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    widget.values.forEachIndexed((index, element) {
      children.add(_buildTabBarItem(index, selectedIndex == index, context));
      if (index < widget.values.length - 1) children.add(widget.itemsSpacing.widthBox);
    });

    return Row(
      children: children,
    );
  }

  Widget _buildTabBarItem(int index, bool isSelected, BuildContext context) {
    final Widget item = GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
        widget.onPressed(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 4),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: AppCorners.xl3gBorder,
          color: isSelected ? context.customColorStyle?.secondary : widget.disabledColor,
        ),
        child: AppText(
          text: widget.values[index],
          textStyle: context.textTheme.labelMedium?.copyWith(
            color: isSelected ? context.customColorStyle?.text : context.customColorStyle?.text3,
          ),
          maxLines: 1,
          overflow: TextOverflow.visible,
        ),
      ),
    );

    if (widget.isExpanded) return Expanded(child: item);
    return item;
  }
}
