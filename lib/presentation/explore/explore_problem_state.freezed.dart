// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'explore_problem_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExploreProblemState {
  List<ProblemData> get problems => throw _privateConstructorUsedError;
  Map<String, bool> get isSelected => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isLoadFinished => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExploreProblemStateCopyWith<ExploreProblemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreProblemStateCopyWith<$Res> {
  factory $ExploreProblemStateCopyWith(
          ExploreProblemState value, $Res Function(ExploreProblemState) then) =
      _$ExploreProblemStateCopyWithImpl<$Res, ExploreProblemState>;

  @useResult
  $Res call(
      {List<ProblemData> problems,
      Map<String, bool> isSelected,
      int page,
      bool isLoadFinished,
      String query,
      bool isLoading});
}

/// @nodoc
class _$ExploreProblemStateCopyWithImpl<$Res, $Val extends ExploreProblemState>
    implements $ExploreProblemStateCopyWith<$Res> {
  _$ExploreProblemStateCopyWithImpl(this._value, this._then);

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
    Object? query = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      problems: null == problems
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<ProblemData>,
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
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExploreProblemStateCopyWith<$Res>
    implements $ExploreProblemStateCopyWith<$Res> {
  factory _$$_ExploreProblemStateCopyWith(_$_ExploreProblemState value,
          $Res Function(_$_ExploreProblemState) then) =
      __$$_ExploreProblemStateCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {List<ProblemData> problems,
      Map<String, bool> isSelected,
      int page,
      bool isLoadFinished,
      String query,
      bool isLoading});
}

/// @nodoc
class __$$_ExploreProblemStateCopyWithImpl<$Res>
    extends _$ExploreProblemStateCopyWithImpl<$Res, _$_ExploreProblemState>
    implements _$$_ExploreProblemStateCopyWith<$Res> {
  __$$_ExploreProblemStateCopyWithImpl(_$_ExploreProblemState _value,
      $Res Function(_$_ExploreProblemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problems = null,
    Object? isSelected = null,
    Object? page = null,
    Object? isLoadFinished = null,
    Object? query = null,
    Object? isLoading = null,
  }) {
    return _then(_$_ExploreProblemState(
      problems: null == problems
          ? _value._problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<ProblemData>,
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
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ExploreProblemState implements _ExploreProblemState {
  _$_ExploreProblemState(
      {required final List<ProblemData> problems,
      required final Map<String, bool> isSelected,
      required this.page,
      required this.isLoadFinished,
      required this.query,
      required this.isLoading})
      : _problems = problems,
        _isSelected = isSelected;

  final List<ProblemData> _problems;
  @override
  List<ProblemData> get problems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_problems);
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
  final String query;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ExploreProblemState(problems: $problems, isSelected: $isSelected, page: $page, isLoadFinished: $isLoadFinished, query: $query, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExploreProblemState &&
            const DeepCollectionEquality().equals(other._problems, _problems) &&
            const DeepCollectionEquality()
                .equals(other._isSelected, _isSelected) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isLoadFinished, isLoadFinished) ||
                other.isLoadFinished == isLoadFinished) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_problems),
      const DeepCollectionEquality().hash(_isSelected),
      page,
      isLoadFinished,
      query,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExploreProblemStateCopyWith<_$_ExploreProblemState> get copyWith =>
      __$$_ExploreProblemStateCopyWithImpl<_$_ExploreProblemState>(
          this, _$identity);
}

abstract class _ExploreProblemState implements ExploreProblemState {
  factory _ExploreProblemState(
      {required final List<ProblemData> problems,
      required final Map<String, bool> isSelected,
      required final int page,
      required final bool isLoadFinished,
      required final String query,
      required final bool isLoading}) = _$_ExploreProblemState;

  @override
  List<ProblemData> get problems;

  @override
  Map<String, bool> get isSelected;

  @override
  int get page;

  @override
  bool get isLoadFinished;

  @override
  String get query;

  @override
  bool get isLoading;

  @override
  @JsonKey(ignore: true)
  _$$_ExploreProblemStateCopyWith<_$_ExploreProblemState> get copyWith =>
      throw _privateConstructorUsedError;
}
