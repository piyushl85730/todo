import "package:flutter/material.dart";

/// GridView with dynamic height
///
/// Usage is almost same as [GridView.count]
class DynamicHeightGridView extends StatelessWidget {
  const DynamicHeightGridView({
    required this.builder,
    required this.itemCount,
    required this.crossAxisCount,
    super.key,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 8,
    this.rowCrossAxisAlignment = CrossAxisAlignment.start,
    this.controller,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
  });

  final IndexedWidgetBuilder builder;
  final EdgeInsetsGeometry? padding;
  final int itemCount;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final CrossAxisAlignment rowCrossAxisAlignment;

  final ScrollPhysics? physics;
  final ScrollController? controller;
  final bool shrinkWrap;

  int columnLength() {
    if (itemCount % crossAxisCount == 0) {
      return itemCount ~/ crossAxisCount;
    } else {
      return (itemCount ~/ crossAxisCount) + 1;
    }
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        controller: controller,
        shrinkWrap: shrinkWrap,
        padding: padding,
        physics: physics,
        itemBuilder: (_, int columnIndex) => _GridRow(
          columnIndex: columnIndex,
          builder: builder,
          itemCount: itemCount,
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisAlignment: rowCrossAxisAlignment,
        ),
        itemCount: columnLength(),
      );
}

class _GridRow extends StatelessWidget {
  const _GridRow({
    required this.columnIndex,
    required this.builder,
    required this.itemCount,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.crossAxisAlignment,
  });

  final IndexedWidgetBuilder builder;
  final int itemCount;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final CrossAxisAlignment crossAxisAlignment;
  final int columnIndex;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          top: (columnIndex == 0) ? 0 : mainAxisSpacing,
        ),
        child: Row(
          crossAxisAlignment: crossAxisAlignment,
          children: List<Widget>.generate(
            (crossAxisCount * 2) - 1,
            (int rowIndex) {
              final int rowNum = rowIndex + 1;
              if (rowNum % 2 == 0) {
                return SizedBox(width: crossAxisSpacing);
              }
              final int rowItemIndex = ((rowNum + 1) ~/ 2) - 1;
              final int itemIndex =
                  (columnIndex * crossAxisCount) + rowItemIndex;
              if (itemIndex > itemCount - 1) {
                return const Expanded(child: SizedBox());
              }
              return Expanded(
                child: builder(context, itemIndex),
              );
            },
          ),
        ),
      );
}
