// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'solve_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SolveState {
  int get nowIndex => throw _privateConstructorUsedError;
  Map<String, int> get answers => throw _privateConstructorUsedError;
  int get solveDuration => throw _privateConstructorUsedError;
  Map<String, bool> get isBookmarked => throw _privateConstructorUsedError;
  SolveMode get solveMode => throw _privateConstructorUsedError;
  bool get isPenToolVisible => throw _privateConstructorUsedError;
  bool get isBook => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SolveStateCopyWith<SolveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolveStateCopyWith<$Res> {
  factory $SolveStateCopyWith(
          SolveState value, $Res Function(SolveState) then) =
      _$SolveStateCopyWithImpl<$Res, SolveState>;
  @useResult
  $Res call(
      {int nowIndex,
      Map<String, int> answers,
      int solveDuration,
      Map<String, bool> isBookmarked,
      SolveMode solveMode,
      bool isPenToolVisible,
      bool isBook});
}

/// @nodoc
class _$SolveStateCopyWithImpl<$Res, $Val extends SolveState>
    implements $SolveStateCopyWith<$Res> {
  _$SolveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nowIndex = null,
    Object? answers = null,
    Object? solveDuration = null,
    Object? isBookmarked = null,
    Object? solveMode = null,
    Object? isPenToolVisible = null,
    Object? isBook = null,
  }) {
    return _then(_value.copyWith(
      nowIndex: null == nowIndex
          ? _value.nowIndex
          : nowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      solveDuration: null == solveDuration
          ? _value.solveDuration
          : solveDuration // ignore: cast_nullable_to_non_nullable
              as int,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      solveMode: null == solveMode
          ? _value.solveMode
          : solveMode // ignore: cast_nullable_to_non_nullable
              as SolveMode,
      isPenToolVisible: null == isPenToolVisible
          ? _value.isPenToolVisible
          : isPenToolVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isBook: null == isBook
          ? _value.isBook
          : isBook // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SolveStateCopyWith<$Res>
    implements $SolveStateCopyWith<$Res> {
  factory _$$_SolveStateCopyWith(
          _$_SolveState value, $Res Function(_$_SolveState) then) =
      __$$_SolveStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int nowIndex,
      Map<String, int> answers,
      int solveDuration,
      Map<String, bool> isBookmarked,
      SolveMode solveMode,
      bool isPenToolVisible,
      bool isBook});
}

/// @nodoc
class __$$_SolveStateCopyWithImpl<$Res>
    extends _$SolveStateCopyWithImpl<$Res, _$_SolveState>
    implements _$$_SolveStateCopyWith<$Res> {
  __$$_SolveStateCopyWithImpl(
      _$_SolveState _value, $Res Function(_$_SolveState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nowIndex = null,
    Object? answers = null,
    Object? solveDuration = null,
    Object? isBookmarked = null,
    Object? solveMode = null,
    Object? isPenToolVisible = null,
    Object? isBook = null,
  }) {
    return _then(_$_SolveState(
      nowIndex: null == nowIndex
          ? _value.nowIndex
          : nowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      solveDuration: null == solveDuration
          ? _value.solveDuration
          : solveDuration // ignore: cast_nullable_to_non_nullable
              as int,
      isBookmarked: null == isBookmarked
          ? _value._isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      solveMode: null == solveMode
          ? _value.solveMode
          : solveMode // ignore: cast_nullable_to_non_nullable
              as SolveMode,
      isPenToolVisible: null == isPenToolVisible
          ? _value.isPenToolVisible
          : isPenToolVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isBook: null == isBook
          ? _value.isBook
          : isBook // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SolveState implements _SolveState {
  _$_SolveState(
      {required this.nowIndex,
      required final Map<String, int> answers,
      required this.solveDuration,
      required final Map<String, bool> isBookmarked,
      required this.solveMode,
      required this.isPenToolVisible,
      required this.isBook})
      : _answers = answers,
        _isBookmarked = isBookmarked;

  @override
  final int nowIndex;
  final Map<String, int> _answers;
  @override
  Map<String, int> get answers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  @override
  final int solveDuration;
  final Map<String, bool> _isBookmarked;
  @override
  Map<String, bool> get isBookmarked {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isBookmarked);
  }

  @override
  final SolveMode solveMode;
  @override
  final bool isPenToolVisible;
  @override
  final bool isBook;

  @override
  String toString() {
    return 'SolveState(nowIndex: $nowIndex, answers: $answers, solveDuration: $solveDuration, isBookmarked: $isBookmarked, solveMode: $solveMode, isPenToolVisible: $isPenToolVisible, isBook: $isBook)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SolveState &&
            (identical(other.nowIndex, nowIndex) ||
                other.nowIndex == nowIndex) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.solveDuration, solveDuration) ||
                other.solveDuration == solveDuration) &&
            const DeepCollectionEquality()
                .equals(other._isBookmarked, _isBookmarked) &&
            (identical(other.solveMode, solveMode) ||
                other.solveMode == solveMode) &&
            (identical(other.isPenToolVisible, isPenToolVisible) ||
                other.isPenToolVisible == isPenToolVisible) &&
            (identical(other.isBook, isBook) || other.isBook == isBook));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      nowIndex,
      const DeepCollectionEquality().hash(_answers),
      solveDuration,
      const DeepCollectionEquality().hash(_isBookmarked),
      solveMode,
      isPenToolVisible,
      isBook);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SolveStateCopyWith<_$_SolveState> get copyWith =>
      __$$_SolveStateCopyWithImpl<_$_SolveState>(this, _$identity);
}

abstract class _SolveState implements SolveState {
  factory _SolveState(
      {required final int nowIndex,
      required final Map<String, int> answers,
      required final int solveDuration,
      required final Map<String, bool> isBookmarked,
      required final SolveMode solveMode,
      required final bool isPenToolVisible,
      required final bool isBook}) = _$_SolveState;

  @override
  int get nowIndex;
  @override
  Map<String, int> get answers;
  @override
  int get solveDuration;
  @override
  Map<String, bool> get isBookmarked;
  @override
  SolveMode get solveMode;
  @override
  bool get isPenToolVisible;
  @override
  bool get isBook;
  @override
  @JsonKey(ignore: true)
  _$$_SolveStateCopyWith<_$_SolveState> get copyWith =>
      throw _privateConstructorUsedError;
}
