import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_content.freezed.dart';

@freezed
class QuestionContent with _$QuestionContent {
  factory QuestionContent({
    required String id,
    required String imageUrl,
  }) = _QuestionContent;
}
