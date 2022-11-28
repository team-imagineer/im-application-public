import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:im_application/domain/model/solve/problem_set.dart';

part 'book_content.freezed.dart';

@freezed
class BookContent with _$BookContent {
  factory BookContent({
    required String id,
    required String learningId,
    required List<ProblemSet> problemSets,
    required List<String> bookmarks,
  }) = _BookContent;
}
