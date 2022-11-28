import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/problem_data.dart';

part 'explore_problem_state.freezed.dart';

@freezed
class ExploreProblemState with _$ExploreProblemState {
  factory ExploreProblemState({
    required List<ProblemData> problems,
    required Map<String, bool> isSelected,
    required int page,
    required bool isLoadFinished,
    required String query,
    required bool isLoading,
  }) = _ExploreProblemState;
}
