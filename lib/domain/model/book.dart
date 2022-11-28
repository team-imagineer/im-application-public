import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

@freezed
class Book with _$Book {
  factory Book({
    required String id,
    required String title,
    required BookType type,
    required String? subject,
    required String? grade,
    required String? year,
    required String? month,
  }) = _Book;
}

enum Sort {
  recentlyOpen,
  recentlyAdd,
  testDate,
}

enum BookType {
  book,
  workbook,
}
