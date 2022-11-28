import 'package:freezed_annotation/freezed_annotation.dart';

part 'solve_state.freezed.dart';

@freezed
class SolveState with _$SolveState {
  factory SolveState({
    required int nowIndex,
    required Map<String, int> answers,
    required int solveDuration,
    required Map<String, bool> isBookmarked,
    required SolveMode solveMode,
    required bool isPenToolVisible,
    required bool isBook,
  }) = _SolveState;
}

enum SolveMode { solve, result }
