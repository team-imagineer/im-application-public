import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:im_application/presentation/common/util/filter_controller.dart';

import '../../domain/model/filter/filter_item.dart';
import '../../ui/service_assets.dart';
import '../../ui/service_colors.dart';

class FilterList extends StatelessWidget {
  final FilterController filterController;

  const FilterList({
    Key? key,
    required this.filterController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filters = filterController.getSelectedFiltersWithRowId();
    return Container(
      margin: filters.isNotEmpty ? const EdgeInsets.only(top: 20) : null,
      child: Wrap(
        spacing: 10,
        children: List.generate(
          filters.length,
          (index) => _FilterDeleteButton(
            rowId: filters[index].key,
            item: filters[index].value,
            onTap: () {
              filterController.onFilterClicked(
                  filters[index].key, filters[index].value.id, context);
            },
          ),
        ),
      ),
    );
  }
}

class _FilterDeleteButton extends StatelessWidget {
  final String rowId;
  final FilterItem item;
  final Function() onTap;

  const _FilterDeleteButton({
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
        padding: const EdgeInsets.fromLTRB(17, 10, 10, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).extension<ServiceColors>()!.white,
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            Text(item.showName),
            SvgPicture.asset(
              ServiceAssets.tagDeleteButton,
              width: 18,
            ),
          ],
        ),
      ),
    );
  }
}
