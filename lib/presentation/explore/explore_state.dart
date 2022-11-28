import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/book.dart';

part 'explore_state.freezed.dart';

@freezed
class ExploreState with _$ExploreState {
  factory ExploreState({
    required List<Book> books,
    required int page,
    required bool isLoadFinished,
  }) = _ExploreState;
}
