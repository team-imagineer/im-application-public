import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/book.dart';

part 'my_book_state.freezed.dart';

List<String> sortNames = ["최근 본 순", "최근 추가한 순", "시험일 순"];

@freezed
class MyBookState with _$MyBookState {
  factory MyBookState({
    required List<Book> books,
    required List<Book> workbooks,
    required Sort sortBy,
    required int nowPageIndex,
    @Default(false) bool loadFinished,
  }) = _MyBookState;
}
