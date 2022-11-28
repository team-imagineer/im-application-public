import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:im_application/domain/model/problem_data.dart';
import 'package:im_application/domain/model/solve_history.dart';

part 'problem_review_data.freezed.dart';

@freezed
class ProblemReviewData with _$ProblemReviewData {
  factory ProblemReviewData({
    required ProblemData problemData,
    required List<bool> corrections,
    required List<SolveHistory> histories,
  }) = _ProblemReviewData;
}
