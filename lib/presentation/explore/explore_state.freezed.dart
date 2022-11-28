// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'explore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExploreState {
  List<Book> get books => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isLoadFinished => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExploreStateCopyWith<ExploreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreStateCopyWith<$Res> {
  factory $ExploreStateCopyWith(
          ExploreState value, $Res Function(ExploreState) then) =
      _$ExploreStateCopyWithImpl<$Res, ExploreState>;
  @useResult
  $Res call({List<Book> books, int page, bool isLoadFinished});
}

/// @nodoc
class _$ExploreStateCopyWithImpl<$Res, $Val extends ExploreState>
    implements $ExploreStateCopyWith<$Res> {
  _$ExploreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
    Object? page = null,
    Object? isLoadFinished = null,
  }) {
    return _then(_value.copyWith(
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
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
abstract class _$$_ExploreStateCopyWith<$Res>
    implements $ExploreStateCopyWith<$Res> {
  factory _$$_ExploreStateCopyWith(
          _$_ExploreState value, $Res Function(_$_ExploreState) then) =
      __$$_ExploreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Book> books, int page, bool isLoadFinished});
}

/// @nodoc
class __$$_ExploreStateCopyWithImpl<$Res>
    extends _$ExploreStateCopyWithImpl<$Res, _$_ExploreState>
    implements _$$_ExploreStateCopyWith<$Res> {
  __$$_ExploreStateCopyWithImpl(
      _$_ExploreState _value, $Res Function(_$_ExploreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
    Object? page = null,
    Object? isLoadFinished = null,
  }) {
    return _then(_$_ExploreState(
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
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

class _$_ExploreState implements _ExploreState {
  _$_ExploreState(
      {required final List<Book> books,
      required this.page,
      required this.isLoadFinished})
      : _books = books;

  final List<Book> _books;
  @override
  List<Book> get books {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  final int page;
  @override
  final bool isLoadFinished;

  @override
  String toString() {
    return 'ExploreState(books: $books, page: $page, isLoadFinished: $isLoadFinished)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExploreState &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isLoadFinished, isLoadFinished) ||
                other.isLoadFinished == isLoadFinished));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_books), page, isLoadFinished);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExploreStateCopyWith<_$_ExploreState> get copyWith =>
      __$$_ExploreStateCopyWithImpl<_$_ExploreState>(this, _$identity);
}

abstract class _ExploreState implements ExploreState {
  factory _ExploreState(
      {required final List<Book> books,
      required final int page,
      required final bool isLoadFinished}) = _$_ExploreState;

  @override
  List<Book> get books;
  @override
  int get page;
  @override
  bool get isLoadFinished;
  @override
  @JsonKey(ignore: true)
  _$$_ExploreStateCopyWith<_$_ExploreState> get copyWith =>
      throw _privateConstructorUsedError;
}
