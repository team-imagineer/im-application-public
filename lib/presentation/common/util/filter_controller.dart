import 'dart:collection';

import 'package:flutter/material.dart';

import '../../../domain/model/filter/filter_item.dart';
import '../../../domain/model/filter/filter_row.dart';

abstract class FilterController {
  final LinkedHashMap<String, FilterRow> _filters = LinkedHashMap();

  FilterController(List<FilterRow> filterData) {
    for (final filterRow in filterData) {
      _filters[filterRow.id] = filterRow;
    }
  }

  List<FilterRow> getFilterData() {
    return List.from(_filters.values);
  }

  List<MapEntry<String, FilterItem>> getSelectedFiltersWithRowId() {
    final List<MapEntry<String, FilterItem>> result = [];
    for (final filterRow in _filters.values) {
      for (final filter in filterRow.items.values) {
        if (filter.selected) {
          result.add(MapEntry(filterRow.id, filter));
        }
      }
    }
    return result;
  }

  void reverseFilterStatus(String rowId, String itemId) {
    final item = _filters[rowId]!.items[itemId]!;
    final isOn = item.selected;
    _filters[rowId]!.items[itemId] = item.copyWith(selected: !isOn);
  }

  void clearFilters() {
    for (final filterRow in _filters.values) {
      for (final filter in filterRow.items.values) {
        if (filter.selected) {
          final item = _filters[filterRow.id]!.items[filter.id]!;
          _filters[filterRow.id]!.items[filter.id] =
              item.copyWith(selected: false);
        }
      }
    }
  }

  void deleteAllFilters(BuildContext context);

  void onFilterClicked(String rowId, String itemId, BuildContext context);
}
