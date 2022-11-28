// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solve_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SolveRecord _$$_SolveRecordFromJson(Map<String, dynamic> json) =>
    _$_SolveRecord(
      id: json['id'] as int?,
      bookId: json['bookId'] as String,
      learningId: json['learningId'] as String,
      problemId: json['problemId'] as String,
      answer: json['answer'] as int?,
      scribbleData: json['scribbleData'] as String?,
    );

Map<String, dynamic> _$$_SolveRecordToJson(_$_SolveRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookId': instance.bookId,
      'learningId': instance.learningId,
      'problemId': instance.problemId,
      'answer': instance.answer,
      'scribbleData': instance.scribbleData,
    };
