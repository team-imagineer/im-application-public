// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReviewState {
  Map<String, List<ProblemReviewData>> get problems =>
      throw _privateConstructorUsedError;
  Map<String, bool> get isSelected => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isLoadFinished => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewStateCopyWith<ReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStateCopyWith<$Res> {
  factory $ReviewStateCopyWith(
          ReviewState value, $Res Function(ReviewState) then) =
      _$ReviewStateCopyWithImpl<$Res, ReviewState>;
  @useResult
  $Res call(
      {Map<String, List<ProblemReviewData>> problems,
      Map<String, bool> isSelected,
      int page,
      bool isLoadFinished});
}

/// @nodoc
class _$ReviewStateCopyWithImpl<$Res, $Val extends ReviewState>
    implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problems = null,
    Object? isSelected = null,
    Object? page = null,
    Object? isLoadFinished = null,
  }) {
    return _then(_value.copyWith(
      problems: null == problems
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ProblemReviewData>>,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadFinished: null == isLoadFinished
          ? _value.isLoadFinished
          : isLoadFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewStateCopyWith<$Res>
    implements $ReviewStateCopyWith<$Res> {
  factory _$$_ReviewStateCopyWith(
          _$_ReviewState value, $Res Function(_$_ReviewState) then) =
      __$$_ReviewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, List<ProblemReviewData>> problems,
      Map<String, bool> isSelected,
      int page,
      bool isLoadFinished});
}

/// @nodoc
class __$$_ReviewStateCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$_ReviewState>
    implements _$$_ReviewStateCopyWith<$Res> {
  __$$_ReviewStateCopyWithImpl(
      _$_ReviewState _value, $Res Function(_$_ReviewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problems = null,
    Object? isSelected = null,
    Object? page = null,
    Object? isLoadFinished = null,
  }) {
    return _then(_$_ReviewState(
      problems: null == problems
          ? _value._problems
          : problems // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ProblemReviewData>>,
      isSelected: null == isSelected
          ? _value._isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadFinished: null == isLoadFinished
          ? _value.isLoadFinished
          : isLoadFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReviewState implements _ReviewState {
  _$_ReviewState(
      {required final Map<String, List<ProblemReviewData>> problems,
      required final Map<String, bool> isSelected,
      required this.page,
      required this.isLoadFinished})
      : _problems = problems,
        _isSelected = isSelected;

  final Map<String, List<ProblemReviewData>> _problems;
  @override
  Map<String, List<ProblemReviewData>> get problems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_problems);
  }

  final Map<String, bool> _isSelected;
  @override
  Map<String, bool> get isSelected {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isSelected);
  }

  @override
  final int page;
  @override
  final bool isLoadFinished;

  @override
  String toString() {
    return 'ReviewState(problems: $problems, isSelected: $isSelected, page: $page, isLoadFinished: $isLoadFinished)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewState &&
            const DeepCollectionEquality().equals(other._problems, _problems) &&
            const DeepCollectionEquality()
                .equals(other._isSelected, _isSelected) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isLoadFinished, isLoadFinished) ||
                other.isLoadFinished == isLoadFinished));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_problems),
      const DeepCollectionEquality().hash(_isSelected),
      page,
      isLoadFinished);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewStateCopyWith<_$_ReviewState> get copyWith =>
      __$$_ReviewStateCopyWithImpl<_$_ReviewState>(this, _$identity);
}

abstract class _ReviewState implements ReviewState {
  factory _ReviewState(
      {required final Map<String, List<ProblemReviewData>> problems,
      required final Map<String, bool> isSelected,
      required final int page,
      required final bool isLoadFinished}) = _$_ReviewState;

  @override
  Map<String, List<ProblemReviewData>> get problems;
  @override
  Map<String, bool> get isSelected;
  @override
  int get page;
  @override
  bool get isLoadFinished;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewStateCopyWith<_$_ReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}
