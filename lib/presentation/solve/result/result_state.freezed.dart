// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResultState {
  Map<String, bool> get isBookmarked => throw _privateConstructorUsedError;
  DialogState get dialogState => throw _privateConstructorUsedError;
  bool get showOnlyWrongProblems => throw _privateConstructorUsedError;
  int get totalScore => throw _privateConstructorUsedError;
  bool get isBook => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultStateCopyWith<ResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultStateCopyWith<$Res> {
  factory $ResultStateCopyWith(
          ResultState value, $Res Function(ResultState) then) =
      _$ResultStateCopyWithImpl<$Res, ResultState>;
  @useResult
  $Res call(
      {Map<String, bool> isBookmarked,
      DialogState dialogState,
      bool showOnlyWrongProblems,
      int totalScore,
      bool isBook});
}

/// @nodoc
class _$ResultStateCopyWithImpl<$Res, $Val extends ResultState>
    implements $ResultStateCopyWith<$Res> {
  _$ResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBookmarked = null,
    Object? dialogState = null,
    Object? showOnlyWrongProblems = null,
    Object? totalScore = null,
    Object? isBook = null,
  }) {
    return _then(_value.copyWith(
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      dialogState: null == dialogState
          ? _value.dialogState
          : dialogState // ignore: cast_nullable_to_non_nullable
              as DialogState,
      showOnlyWrongProblems: null == showOnlyWrongProblems
          ? _value.showOnlyWrongProblems
          : showOnlyWrongProblems // ignore: cast_nullable_to_non_nullable
              as bool,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      isBook: null == isBook
          ? _value.isBook
          : isBook // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultStateCopyWith<$Res>
    implements $ResultStateCopyWith<$Res> {
  factory _$$_ResultStateCopyWith(
          _$_ResultState value, $Res Function(_$_ResultState) then) =
      __$$_ResultStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, bool> isBookmarked,
      DialogState dialogState,
      bool showOnlyWrongProblems,
      int totalScore,
      bool isBook});
}

/// @nodoc
class __$$_ResultStateCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$_ResultState>
    implements _$$_ResultStateCopyWith<$Res> {
  __$$_ResultStateCopyWithImpl(
      _$_ResultState _value, $Res Function(_$_ResultState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBookmarked = null,
    Object? dialogState = null,
    Object? showOnlyWrongProblems = null,
    Object? totalScore = null,
    Object? isBook = null,
  }) {
    return _then(_$_ResultState(
      isBookmarked: null == isBookmarked
          ? _value._isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      dialogState: null == dialogState
          ? _value.dialogState
          : dialogState // ignore: cast_nullable_to_non_nullable
              as DialogState,
      showOnlyWrongProblems: null == showOnlyWrongProblems
          ? _value.showOnlyWrongProblems
          : showOnlyWrongProblems // ignore: cast_nullable_to_non_nullable
              as bool,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      isBook: null == isBook
          ? _value.isBook
          : isBook // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ResultState implements _ResultState {
  _$_ResultState(
      {required final Map<String, bool> isBookmarked,
      required this.dialogState,
      required this.showOnlyWrongProblems,
      required this.totalScore,
      required this.isBook})
      : _isBookmarked = isBookmarked;

  final Map<String, bool> _isBookmarked;
  @override
  Map<String, bool> get isBookmarked {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isBookmarked);
  }

  @override
  final DialogState dialogState;
  @override
  final bool showOnlyWrongProblems;
  @override
  final int totalScore;
  @override
  final bool isBook;

  @override
  String toString() {
    return 'ResultState(isBookmarked: $isBookmarked, dialogState: $dialogState, showOnlyWrongProblems: $showOnlyWrongProblems, totalScore: $totalScore, isBook: $isBook)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultState &&
            const DeepCollectionEquality()
                .equals(other._isBookmarked, _isBookmarked) &&
            (identical(other.dialogState, dialogState) ||
                other.dialogState == dialogState) &&
            (identical(other.showOnlyWrongProblems, showOnlyWrongProblems) ||
                other.showOnlyWrongProblems == showOnlyWrongProblems) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.isBook, isBook) || other.isBook == isBook));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_isBookmarked),
      dialogState,
      showOnlyWrongProblems,
      totalScore,
      isBook);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultStateCopyWith<_$_ResultState> get copyWith =>
      __$$_ResultStateCopyWithImpl<_$_ResultState>(this, _$identity);
}

abstract class _ResultState implements ResultState {
  factory _ResultState(
      {required final Map<String, bool> isBookmarked,
      required final DialogState dialogState,
      required final bool showOnlyWrongProblems,
      required final int totalScore,
      required final bool isBook}) = _$_ResultState;

  @override
  Map<String, bool> get isBookmarked;
  @override
  DialogState get dialogState;
  @override
  bool get showOnlyWrongProblems;
  @override
  int get totalScore;
  @override
  bool get isBook;
  @override
  @JsonKey(ignore: true)
  _$$_ResultStateCopyWith<_$_ResultState> get copyWith =>
      throw _privateConstructorUsedError;
}
