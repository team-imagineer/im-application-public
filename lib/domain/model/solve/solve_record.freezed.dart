// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'solve_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolveRecord _$SolveRecordFromJson(Map<String, dynamic> json) {
  return _SolveRecord.fromJson(json);
}

/// @nodoc
mixin _$SolveRecord {
  int? get id => throw _privateConstructorUsedError;
  String get bookId => throw _privateConstructorUsedError;
  String get learningId => throw _privateConstructorUsedError;
  String get problemId => throw _privateConstructorUsedError;
  int? get answer => throw _privateConstructorUsedError;
  String? get scribbleData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolveRecordCopyWith<SolveRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolveRecordCopyWith<$Res> {
  factory $SolveRecordCopyWith(
          SolveRecord value, $Res Function(SolveRecord) then) =
      _$SolveRecordCopyWithImpl<$Res, SolveRecord>;
  @useResult
  $Res call(
      {int? id,
      String bookId,
      String learningId,
      String problemId,
      int? answer,
      String? scribbleData});
}

/// @nodoc
class _$SolveRecordCopyWithImpl<$Res, $Val extends SolveRecord>
    implements $SolveRecordCopyWith<$Res> {
  _$SolveRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookId = null,
    Object? learningId = null,
    Object? problemId = null,
    Object? answer = freezed,
    Object? scribbleData = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      learningId: null == learningId
          ? _value.learningId
          : learningId // ignore: cast_nullable_to_non_nullable
              as String,
      problemId: null == problemId
          ? _value.problemId
          : problemId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int?,
      scribbleData: freezed == scribbleData
          ? _value.scribbleData
          : scribbleData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SolveRecordCopyWith<$Res>
    implements $SolveRecordCopyWith<$Res> {
  factory _$$_SolveRecordCopyWith(
          _$_SolveRecord value, $Res Function(_$_SolveRecord) then) =
      __$$_SolveRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String bookId,
      String learningId,
      String problemId,
      int? answer,
      String? scribbleData});
}

/// @nodoc
class __$$_SolveRecordCopyWithImpl<$Res>
    extends _$SolveRecordCopyWithImpl<$Res, _$_SolveRecord>
    implements _$$_SolveRecordCopyWith<$Res> {
  __$$_SolveRecordCopyWithImpl(
      _$_SolveRecord _value, $Res Function(_$_SolveRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookId = null,
    Object? learningId = null,
    Object? problemId = null,
    Object? answer = freezed,
    Object? scribbleData = freezed,
  }) {
    return _then(_$_SolveRecord(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      learningId: null == learningId
          ? _value.learningId
          : learningId // ignore: cast_nullable_to_non_nullable
              as String,
      problemId: null == problemId
          ? _value.problemId
          : problemId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int?,
      scribbleData: freezed == scribbleData
          ? _value.scribbleData
          : scribbleData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SolveRecord implements _SolveRecord {
  _$_SolveRecord(
      {required this.id,
      required this.bookId,
      required this.learningId,
      required this.problemId,
      required this.answer,
      required this.scribbleData});

  factory _$_SolveRecord.fromJson(Map<String, dynamic> json) =>
      _$$_SolveRecordFromJson(json);

  @override
  final int? id;
  @override
  final String bookId;
  @override
  final String learningId;
  @override
  final String problemId;
  @override
  final int? answer;
  @override
  final String? scribbleData;

  @override
  String toString() {
    return 'SolveRecord(id: $id, bookId: $bookId, learningId: $learningId, problemId: $problemId, answer: $answer, scribbleData: $scribbleData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SolveRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.learningId, learningId) ||
                other.learningId == learningId) &&
            (identical(other.problemId, problemId) ||
                other.problemId == problemId) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.scribbleData, scribbleData) ||
                other.scribbleData == scribbleData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, bookId, learningId, problemId, answer, scribbleData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SolveRecordCopyWith<_$_SolveRecord> get copyWith =>
      __$$_SolveRecordCopyWithImpl<_$_SolveRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SolveRecordToJson(
      this,
    );
  }
}

abstract class _SolveRecord implements SolveRecord {
  factory _SolveRecord(
      {required final int? id,
      required final String bookId,
      required final String learningId,
      required final String problemId,
      required final int? answer,
      required final String? scribbleData}) = _$_SolveRecord;

  factory _SolveRecord.fromJson(Map<String, dynamic> json) =
      _$_SolveRecord.fromJson;

  @override
  int? get id;
  @override
  String get bookId;
  @override
  String get learningId;
  @override
  String get problemId;
  @override
  int? get answer;
  @override
  String? get scribbleData;
  @override
  @JsonKey(ignore: true)
  _$$_SolveRecordCopyWith<_$_SolveRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
