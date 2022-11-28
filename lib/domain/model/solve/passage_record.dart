import 'package:freezed_annotation/freezed_annotation.dart';

part 'passage_record.freezed.dart';
part 'passage_record.g.dart';

@freezed
class PassageRecord with _$PassageRecord {
  factory PassageRecord({
    required int id,
    required String bookId,
    required String learningId,
    required String passageId,
    @Default(0) int time,
    required String? scribbleData,
  }) = _PassageRecord;

  factory PassageRecord.fromJson(Map<String, dynamic> json) =>
      _$PassageRecordFromJson(json);
}
