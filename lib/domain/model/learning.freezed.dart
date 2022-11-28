// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'learning.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Learning {
  String get id => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  int? get elapsed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LearningCopyWith<Learning> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningCopyWith<$Res> {
  factory $LearningCopyWith(Learning value, $Res Function(Learning) then) =
      _$LearningCopyWithImpl<$Res, Learning>;
  @useResult
  $Res call({String id, Status status, int? score, int? elapsed});
}

/// @nodoc
class _$LearningCopyWithImpl<$Res, $Val extends Learning>
    implements $LearningCopyWith<$Res> {
  _$LearningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? score = freezed,
    Object? elapsed = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      elapsed: freezed == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LearningCopyWith<$Res> implements $LearningCopyWith<$Res> {
  factory _$$_LearningCopyWith(
          _$_Learning value, $Res Function(_$_Learning) then) =
      __$$_LearningCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Status status, int? score, int? elapsed});
}

/// @nodoc
class __$$_LearningCopyWithImpl<$Res>
    extends _$LearningCopyWithImpl<$Res, _$_Learning>
    implements _$$_LearningCopyWith<$Res> {
  __$$_LearningCopyWithImpl(
      _$_Learning _value, $Res Function(_$_Learning) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? score = freezed,
    Object? elapsed = freezed,
  }) {
    return _then(_$_Learning(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      elapsed: freezed == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_Learning implements _Learning {
  _$_Learning(
      {required this.id,
      required this.status,
      required this.score,
      required this.elapsed});

  @override
  final String id;
  @override
  final Status status;
  @override
  final int? score;
  @override
  final int? elapsed;

  @override
  String toString() {
    return 'Learning(id: $id, status: $status, score: $score, elapsed: $elapsed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Learning &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, status, score, elapsed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LearningCopyWith<_$_Learning> get copyWith =>
      __$$_LearningCopyWithImpl<_$_Learning>(this, _$identity);
}

abstract class _Learning implements Learning {
  factory _Learning(
      {required final String id,
      required final Status status,
      required final int? score,
      required final int? elapsed}) = _$_Learning;

  @override
  String get id;
  @override
  Status get status;
  @override
  int? get score;
  @override
  int? get elapsed;
  @override
  @JsonKey(ignore: true)
  _$$_LearningCopyWith<_$_Learning> get copyWith =>
      throw _privateConstructorUsedError;
}
