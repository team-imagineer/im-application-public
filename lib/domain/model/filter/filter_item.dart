import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_item.freezed.dart';

@freezed
class FilterItem with _$FilterItem {
  factory FilterItem({
    required String id,
    required String showName,
    @Default(false) bool selected,
  }) = _FilterItem;
}
