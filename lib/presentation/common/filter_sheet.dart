import "package:flutter/material.dart";
import 'package:im_application/presentation/common/seodaang_title.dart';
import 'package:im_application/presentation/common/util/filter_controller.dart';

import '../../domain/model/filter/filter_item.dart';
import '../../ui/service_colors.dart';

class FilterSheet extends StatelessWidget {
  final FilterController filterController;
  final String title;
  final double height;
  final Widget? upperWidget;
  final Widget? lowerWidget;

  const FilterSheet({
    Key? key,
    required this.filterController,
    this.title = "필터 설정",
    this.height = 450,
    this.upperWidget,
    this.lowerWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filters = filterController.getFilterData();
    final List<Widget> filterItems = List.generate(filters.length, (index) {
      final row = filters[index];
      final items = row.getItemList();

      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 100,
            child: Text(
              row.showName,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).extension<ServiceColors>()!.textBlack,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 220,
            child: Wrap(
              spacing: 10,
              runSpacing: 5,
              children: List.generate(items.length, (innerIndex) {
                return _FilterButton(
                    rowId: row.id,
                    item: items[innerIndex],
                    onTap: () {
                      filterController.onFilterClicked(
                        row.id,
                        items[innerIndex].id,
                        context,
                      );
                    });
              }),
            ),
          ),
        ],
      );
    });

    if (upperWidget != null) {
      filterItems.insert(0, upperWidget!);
    }
    if (lowerWidget != null) {
      filterItems.insert(0, lowerWidget!);
    }

    return SafeArea(
      child: Container(
        height: height,
        padding: const EdgeInsets.fromLTRB(60, 40, 60, 0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Theme.of(context).extension<ServiceColors>()!.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SeodaangTitle(title, isMini: true),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context)
                        .extension<ServiceColors>()!
                        .secondaryTextGrey,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            const SizedBox(height: 50),
            Wrap(
              direction: Axis.vertical,
              spacing: 15,
              children: filterItems,
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String rowId;
  final FilterItem item;
  final Function() onTap;

  const _FilterButton({
    Key? key,
    required this.rowId,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(17, 10, 17, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: item.selected
              ? Theme.of(context).extension<ServiceColors>()!.buttonOrange
              : Theme.of(context).extension<ServiceColors>()!.buttonLightGrey,
        ),
        child: Text(
          item.showName,
          style: TextStyle(
            fontSize: 16,
            color: item.selected
                ? Theme.of(context).extension<ServiceColors>()!.white
                : Theme.of(context).extension<ServiceColors>()!.textBlack,
          ),
        ),
      ),
    );
  }
}
