import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/problem_review_data.dart';

part 'review_state.freezed.dart';

@freezed
class ReviewState with _$ReviewState {
  factory ReviewState({
    required Map<String, List<ProblemReviewData>> problems,
    required Map<String, bool> isSelected,
    required int page,
    required bool isLoadFinished,
  }) = _ReviewState;
}
