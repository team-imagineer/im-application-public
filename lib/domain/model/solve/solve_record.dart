import 'package:freezed_annotation/freezed_annotation.dart';

part 'solve_record.freezed.dart';
part 'solve_record.g.dart';

@freezed
class SolveRecord with _$SolveRecord {
  factory SolveRecord({
    required int? id,
    required String bookId,
    required String learningId,
    required String problemId,
    required int? answer,
    required String? scribbleData,
  }) = _SolveRecord;

  factory SolveRecord.fromJson(Map<String, dynamic> json) =>
      _$SolveRecordFromJson(json);
}
