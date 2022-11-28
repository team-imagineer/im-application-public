import 'package:freezed_annotation/freezed_annotation.dart';

part 'passage.freezed.dart';

@freezed
class Passage with _$Passage {
  factory Passage({
    required String id,
    required String imageUrl,
    required int sequenceNumber,
    String? explanationUrl,
  }) = _Passage;
}
