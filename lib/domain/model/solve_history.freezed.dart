// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'solve_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SolveHistory {
  DateTime get solvedTime => throw _privateConstructorUsedError;
  int? get response => throw _privateConstructorUsedError;
  String get learningId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SolveHistoryCopyWith<SolveHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolveHistoryCopyWith<$Res> {
  factory $SolveHistoryCopyWith(
          SolveHistory value, $Res Function(SolveHistory) then) =
      _$SolveHistoryCopyWithImpl<$Res, SolveHistory>;
  @useResult
  $Res call({DateTime solvedTime, int? response, String learningId});
}

/// @nodoc
class _$SolveHistoryCopyWithImpl<$Res, $Val extends SolveHistory>
    implements $SolveHistoryCopyWith<$Res> {
  _$SolveHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solvedTime = null,
    Object? response = freezed,
    Object? learningId = null,
  }) {
    return _then(_value.copyWith(
      solvedTime: null == solvedTime
          ? _value.solvedTime
          : solvedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as int?,
      learningId: null == learningId
          ? _value.learningId
          : learningId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SolveHistoryCopyWith<$Res>
    implements $SolveHistoryCopyWith<$Res> {
  factory _$$_SolveHistoryCopyWith(
          _$_SolveHistory value, $Res Function(_$_SolveHistory) then) =
      __$$_SolveHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime solvedTime, int? response, String learningId});
}

/// @nodoc
class __$$_SolveHistoryCopyWithImpl<$Res>
    extends _$SolveHistoryCopyWithImpl<$Res, _$_SolveHistory>
    implements _$$_SolveHistoryCopyWith<$Res> {
  __$$_SolveHistoryCopyWithImpl(
      _$_SolveHistory _value, $Res Function(_$_SolveHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solvedTime = null,
    Object? response = freezed,
    Object? learningId = null,
  }) {
    return _then(_$_SolveHistory(
      solvedTime: null == solvedTime
          ? _value.solvedTime
          : solvedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as int?,
      learningId: null == learningId
          ? _value.learningId
          : learningId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SolveHistory implements _SolveHistory {
  _$_SolveHistory(
      {required this.solvedTime,
      required this.response,
      required this.learningId});

  @override
  final DateTime solvedTime;
  @override
  final int? response;
  @override
  final String learningId;

  @override
  String toString() {
    return 'SolveHistory(solvedTime: $solvedTime, response: $response, learningId: $learningId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SolveHistory &&
            (identical(other.solvedTime, solvedTime) ||
                other.solvedTime == solvedTime) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.learningId, learningId) ||
                other.learningId == learningId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, solvedTime, response, learningId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SolveHistoryCopyWith<_$_SolveHistory> get copyWith =>
      __$$_SolveHistoryCopyWithImpl<_$_SolveHistory>(this, _$identity);
}

abstract class _SolveHistory implements SolveHistory {
  factory _SolveHistory(
      {required final DateTime solvedTime,
      required final int? response,
      required final String learningId}) = _$_SolveHistory;

  @override
  DateTime get solvedTime;
  @override
  int? get response;
  @override
  String get learningId;
  @override
  @JsonKey(ignore: true)
  _$$_SolveHistoryCopyWith<_$_SolveHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
