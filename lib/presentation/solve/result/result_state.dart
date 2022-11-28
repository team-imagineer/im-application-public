import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.freezed.dart';

@freezed
class ResultState with _$ResultState {
  factory ResultState({
    required Map<String, bool> isBookmarked,
    required DialogState dialogState,
    required bool showOnlyWrongProblems,
    required int totalScore,
    required bool isBook,
  }) = _ResultState;
}

enum DialogState { initial, onLoading, finished }
