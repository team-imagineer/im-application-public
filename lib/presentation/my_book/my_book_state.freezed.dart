// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyBookState {
  List<Book> get books => throw _privateConstructorUsedError;
  List<Book> get workbooks => throw _privateConstructorUsedError;
  Sort get sortBy => throw _privateConstructorUsedError;
  int get nowPageIndex => throw _privateConstructorUsedError;
  bool get loadFinished => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyBookStateCopyWith<MyBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBookStateCopyWith<$Res> {
  factory $MyBookStateCopyWith(
          MyBookState value, $Res Function(MyBookState) then) =
      _$MyBookStateCopyWithImpl<$Res, MyBookState>;
  @useResult
  $Res call(
      {List<Book> books,
      List<Book> workbooks,
      Sort sortBy,
      int nowPageIndex,
      bool loadFinished});
}

/// @nodoc
class _$MyBookStateCopyWithImpl<$Res, $Val extends MyBookState>
    implements $MyBookStateCopyWith<$Res> {
  _$MyBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
    Object? workbooks = null,
    Object? sortBy = null,
    Object? nowPageIndex = null,
    Object? loadFinished = null,
  }) {
    return _then(_value.copyWith(
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      workbooks: null == workbooks
          ? _value.workbooks
          : workbooks // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as Sort,
      nowPageIndex: null == nowPageIndex
          ? _value.nowPageIndex
          : nowPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      loadFinished: null == loadFinished
          ? _value.loadFinished
          : loadFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyBookStateCopyWith<$Res>
    implements $MyBookStateCopyWith<$Res> {
  factory _$$_MyBookStateCopyWith(
          _$_MyBookState value, $Res Function(_$_MyBookState) then) =
      __$$_MyBookStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Book> books,
      List<Book> workbooks,
      Sort sortBy,
      int nowPageIndex,
      bool loadFinished});
}

/// @nodoc
class __$$_MyBookStateCopyWithImpl<$Res>
    extends _$MyBookStateCopyWithImpl<$Res, _$_MyBookState>
    implements _$$_MyBookStateCopyWith<$Res> {
  __$$_MyBookStateCopyWithImpl(
      _$_MyBookState _value, $Res Function(_$_MyBookState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
    Object? workbooks = null,
    Object? sortBy = null,
    Object? nowPageIndex = null,
    Object? loadFinished = null,
  }) {
    return _then(_$_MyBookState(
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      workbooks: null == workbooks
          ? _value._workbooks
          : workbooks // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as Sort,
      nowPageIndex: null == nowPageIndex
          ? _value.nowPageIndex
          : nowPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      loadFinished: null == loadFinished
          ? _value.loadFinished
          : loadFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MyBookState implements _MyBookState {
  _$_MyBookState(
      {required final List<Book> books,
      required final List<Book> workbooks,
      required this.sortBy,
      required this.nowPageIndex,
      this.loadFinished = false})
      : _books = books,
        _workbooks = workbooks;

  final List<Book> _books;
  @override
  List<Book> get books {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  final List<Book> _workbooks;
  @override
  List<Book> get workbooks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workbooks);
  }

  @override
  final Sort sortBy;
  @override
  final int nowPageIndex;
  @override
  @JsonKey()
  final bool loadFinished;

  @override
  String toString() {
    return 'MyBookState(books: $books, workbooks: $workbooks, sortBy: $sortBy, nowPageIndex: $nowPageIndex, loadFinished: $loadFinished)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyBookState &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            const DeepCollectionEquality()
                .equals(other._workbooks, _workbooks) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.nowPageIndex, nowPageIndex) ||
                other.nowPageIndex == nowPageIndex) &&
            (identical(other.loadFinished, loadFinished) ||
                other.loadFinished == loadFinished));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_books),
      const DeepCollectionEquality().hash(_workbooks),
      sortBy,
      nowPageIndex,
      loadFinished);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyBookStateCopyWith<_$_MyBookState> get copyWith =>
      __$$_MyBookStateCopyWithImpl<_$_MyBookState>(this, _$identity);
}

abstract class _MyBookState implements MyBookState {
  factory _MyBookState(
      {required final List<Book> books,
      required final List<Book> workbooks,
      required final Sort sortBy,
      required final int nowPageIndex,
      final bool loadFinished}) = _$_MyBookState;

  @override
  List<Book> get books;
  @override
  List<Book> get workbooks;
  @override
  Sort get sortBy;
  @override
  int get nowPageIndex;
  @override
  bool get loadFinished;
  @override
  @JsonKey(ignore: true)
  _$$_MyBookStateCopyWith<_$_MyBookState> get copyWith =>
      throw _privateConstructorUsedError;
}
