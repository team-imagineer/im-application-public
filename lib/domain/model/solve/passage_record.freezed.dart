// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'passage_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PassageRecord _$PassageRecordFromJson(Map<String, dynamic> json) {
  return _PassageRecord.fromJson(json);
}

/// @nodoc
mixin _$PassageRecord {
  int get id => throw _privateConstructorUsedError;
  String get bookId => throw _privateConstructorUsedError;
  String get learningId => throw _privateConstructorUsedError;
  String get passageId => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  String? get scribbleData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassageRecordCopyWith<PassageRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassageRecordCopyWith<$Res> {
  factory $PassageRecordCopyWith(
          PassageRecord value, $Res Function(PassageRecord) then) =
      _$PassageRecordCopyWithImpl<$Res, PassageRecord>;
  @useResult
  $Res call(
      {int id,
      String bookId,
      String learningId,
      String passageId,
      int time,
      String? scribbleData});
}

/// @nodoc
class _$PassageRecordCopyWithImpl<$Res, $Val extends PassageRecord>
    implements $PassageRecordCopyWith<$Res> {
  _$PassageRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookId = null,
    Object? learningId = null,
    Object? passageId = null,
    Object? time = null,
    Object? scribbleData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      learningId: null == learningId
          ? _value.learningId
          : learningId // ignore: cast_nullable_to_non_nullable
              as String,
      passageId: null == passageId
          ? _value.passageId
          : passageId // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      scribbleData: freezed == scribbleData
          ? _value.scribbleData
          : scribbleData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PassageRecordCopyWith<$Res>
    implements $PassageRecordCopyWith<$Res> {
  factory _$$_PassageRecordCopyWith(
          _$_PassageRecord value, $Res Function(_$_PassageRecord) then) =
      __$$_PassageRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String bookId,
      String learningId,
      String passageId,
      int time,
      String? scribbleData});
}

/// @nodoc
class __$$_PassageRecordCopyWithImpl<$Res>
    extends _$PassageRecordCopyWithImpl<$Res, _$_PassageRecord>
    implements _$$_PassageRecordCopyWith<$Res> {
  __$$_PassageRecordCopyWithImpl(
      _$_PassageRecord _value, $Res Function(_$_PassageRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookId = null,
    Object? learningId = null,
    Object? passageId = null,
    Object? time = null,
    Object? scribbleData = freezed,
  }) {
    return _then(_$_PassageRecord(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      learningId: null == learningId
          ? _value.learningId
          : learningId // ignore: cast_nullable_to_non_nullable
              as String,
      passageId: null == passageId
          ? _value.passageId
          : passageId // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      scribbleData: freezed == scribbleData
          ? _value.scribbleData
          : scribbleData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PassageRecord implements _PassageRecord {
  _$_PassageRecord(
      {required this.id,
      required this.bookId,
      required this.learningId,
      required this.passageId,
      this.time = 0,
      required this.scribbleData});

  factory _$_PassageRecord.fromJson(Map<String, dynamic> json) =>
      _$$_PassageRecordFromJson(json);

  @override
  final int id;
  @override
  final String bookId;
  @override
  final String learningId;
  @override
  final String passageId;
  @override
  @JsonKey()
  final int time;
  @override
  final String? scribbleData;

  @override
  String toString() {
    return 'PassageRecord(id: $id, bookId: $bookId, learningId: $learningId, passageId: $passageId, time: $time, scribbleData: $scribbleData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PassageRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.learningId, learningId) ||
                other.learningId == learningId) &&
            (identical(other.passageId, passageId) ||
                other.passageId == passageId) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.scribbleData, scribbleData) ||
                other.scribbleData == scribbleData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, bookId, learningId, passageId, time, scribbleData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PassageRecordCopyWith<_$_PassageRecord> get copyWith =>
      __$$_PassageRecordCopyWithImpl<_$_PassageRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PassageRecordToJson(
      this,
    );
  }
}

abstract class _PassageRecord implements PassageRecord {
  factory _PassageRecord(
      {required final int id,
      required final String bookId,
      required final String learningId,
      required final String passageId,
      final int time,
      required final String? scribbleData}) = _$_PassageRecord;

  factory _PassageRecord.fromJson(Map<String, dynamic> json) =
      _$_PassageRecord.fromJson;

  @override
  int get id;
  @override
  String get bookId;
  @override
  String get learningId;
  @override
  String get passageId;
  @override
  int get time;
  @override
  String? get scribbleData;
  @override
  @JsonKey(ignore: true)
  _$$_PassageRecordCopyWith<_$_PassageRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
