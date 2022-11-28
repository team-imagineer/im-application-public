import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:im_application/domain/model/solve/passage.dart';
import 'package:im_application/domain/model/solve/problem.dart';

part 'problem_set.freezed.dart';

@freezed
class ProblemSet with _$ProblemSet {
  factory ProblemSet({
    required String id,
    required int sequenceNumber,
    required List<Problem> problems,
    Passage? passage,
  }) = _ProblemSet;
}
