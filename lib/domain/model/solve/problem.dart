import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:im_application/domain/model/solve/answer_content.dart';
import 'package:im_application/domain/model/solve/question_content.dart';

part 'problem.freezed.dart';

@freezed
class Problem with _$Problem {
  factory Problem({
    required String id,
    required QuestionContent question,
    required bool solvable,
    required int sequenceNumber,
    required String? category,
    required String? lowCategory,
    required int? indexNumber,
    required int? correctAnswer,
    required AnswerContent? answer,
    required int? score,
  }) = _Problem;
}
