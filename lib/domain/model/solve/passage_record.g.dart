// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passage_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PassageRecord _$$_PassageRecordFromJson(Map<String, dynamic> json) =>
    _$_PassageRecord(
      id: json['id'] as int,
      bookId: json['bookId'] as String,
      learningId: json['learningId'] as String,
      passageId: json['passageId'] as String,
      time: json['time'] as int? ?? 0,
      scribbleData: json['scribbleData'] as String?,
    );

Map<String, dynamic> _$$_PassageRecordToJson(_$_PassageRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookId': instance.bookId,
      'learningId': instance.learningId,
      'passageId': instance.passageId,
      'time': instance.time,
      'scribbleData': instance.scribbleData,
    };
