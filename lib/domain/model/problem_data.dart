import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:im_application/domain/model/solve/problem.dart';

part 'problem_data.freezed.dart';

@freezed
class ProblemData with _$ProblemData {
  factory ProblemData({
    required String id,
    required String name,
    required Problem problem,
    required String bookTitle,
    required String subject,
    required String? category,
    required String? lowCategory,
    required double wrongRate,
  }) = _ProblemData;
}
