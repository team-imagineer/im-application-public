import 'dart:collection';

import 'filter_item.dart';

class FilterRow {
  final String id;
  final String showName;
  LinkedHashMap<String, FilterItem> items = LinkedHashMap();

  FilterRow({
    required this.id,
    required this.showName,
    required List<FilterItem> itemList,
  }) {
    for (final item in itemList) {
      items[item.id] = item;
    }
  }

  List<FilterItem> getItemList() {
    return List.from(items.values);
  }

  List<FilterItem> getSelectedItemList() {
    final List<FilterItem> result = [];

    for (final item in items.values) {
      if (item.selected) {
        result.add(item);
      }
    }

    return result;
  }
}
