import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_content.freezed.dart';

@freezed
class AnswerContent with _$AnswerContent {
  factory AnswerContent({
    required String id,
    required String imageUrl,
    String? explanationUrl,
  }) = _AnswerContent;
}
