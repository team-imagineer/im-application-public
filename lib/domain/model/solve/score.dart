import 'package:freezed_annotation/freezed_annotation.dart';

part 'score.freezed.dart';

@freezed
class Score with _$Score {
  factory Score({
    required int duration,
    required int correctCount,
    required Map<String, int> score,
    required Map<String, bool> isCorrect,
  }) = _Score;
}
