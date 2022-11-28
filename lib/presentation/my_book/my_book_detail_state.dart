import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/learning.dart';

part 'my_book_detail_state.freezed.dart';

@freezed
class MyBookDetailState with _$MyBookDetailState {
  factory MyBookDetailState({
    required List<Learning> learnings,
    required bool isEditMode,
    required Map<String, bool> isSelected,
  }) = _MyBookDetailState;
}
