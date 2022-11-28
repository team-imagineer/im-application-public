// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Score {
  int get duration => throw _privateConstructorUsedError;
  int get correctCount => throw _privateConstructorUsedError;
  Map<String, int> get score => throw _privateConstructorUsedError;
  Map<String, bool> get isCorrect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScoreCopyWith<Score> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreCopyWith<$Res> {
  factory $ScoreCopyWith(Score value, $Res Function(Score) then) =
      _$ScoreCopyWithImpl<$Res, Score>;
  @useResult
  $Res call(
      {int duration,
      int correctCount,
      Map<String, int> score,
      Map<String, bool> isCorrect});
}

/// @nodoc
class _$ScoreCopyWithImpl<$Res, $Val extends Score>
    implements $ScoreCopyWith<$Res> {
  _$ScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? correctCount = null,
    Object? score = null,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScoreCopyWith<$Res> implements $ScoreCopyWith<$Res> {
  factory _$$_ScoreCopyWith(_$_Score value, $Res Function(_$_Score) then) =
      __$$_ScoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int duration,
      int correctCount,
      Map<String, int> score,
      Map<String, bool> isCorrect});
}

/// @nodoc
class __$$_ScoreCopyWithImpl<$Res> extends _$ScoreCopyWithImpl<$Res, _$_Score>
    implements _$$_ScoreCopyWith<$Res> {
  __$$_ScoreCopyWithImpl(_$_Score _value, $Res Function(_$_Score) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? correctCount = null,
    Object? score = null,
    Object? isCorrect = null,
  }) {
    return _then(_$_Score(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value._score
          : score // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isCorrect: null == isCorrect
          ? _value._isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

class _$_Score implements _Score {
  _$_Score(
      {required this.duration,
      required this.correctCount,
      required final Map<String, int> score,
      required final Map<String, bool> isCorrect})
      : _score = score,
        _isCorrect = isCorrect;

  @override
  final int duration;
  @override
  final int correctCount;
  final Map<String, int> _score;
  @override
  Map<String, int> get score {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_score);
  }

  final Map<String, bool> _isCorrect;
  @override
  Map<String, bool> get isCorrect {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isCorrect);
  }

  @override
  String toString() {
    return 'Score(duration: $duration, correctCount: $correctCount, score: $score, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Score &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            const DeepCollectionEquality().equals(other._score, _score) &&
            const DeepCollectionEquality()
                .equals(other._isCorrect, _isCorrect));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      duration,
      correctCount,
      const DeepCollectionEquality().hash(_score),
      const DeepCollectionEquality().hash(_isCorrect));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScoreCopyWith<_$_Score> get copyWith =>
      __$$_ScoreCopyWithImpl<_$_Score>(this, _$identity);
}

abstract class _Score implements Score {
  factory _Score(
      {required final int duration,
      required final int correctCount,
      required final Map<String, int> score,
      required final Map<String, bool> isCorrect}) = _$_Score;

  @override
  int get duration;
  @override
  int get correctCount;
  @override
  Map<String, int> get score;
  @override
  Map<String, bool> get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$$_ScoreCopyWith<_$_Score> get copyWith =>
      throw _privateConstructorUsedError;
}
