import 'package:freezed_annotation/freezed_annotation.dart';

part 'solve_history.freezed.dart';

@freezed
class SolveHistory with _$SolveHistory {
  factory SolveHistory({
    required DateTime solvedTime,
    required int? response,
    required String learningId,
  }) = _SolveHistory;
}
