// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookContent {
  String get id => throw _privateConstructorUsedError;
  String get learningId => throw _privateConstructorUsedError;
  List<ProblemSet> get problemSets => throw _privateConstructorUsedError;
  List<String> get bookmarks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookContentCopyWith<BookContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookContentCopyWith<$Res> {
  factory $BookContentCopyWith(
          BookContent value, $Res Function(BookContent) then) =
      _$BookContentCopyWithImpl<$Res, BookContent>;
  @useResult
  $Res call(
      {String id,
      String learningId,
      List<ProblemSet> problemSets,
      List<String> bookmarks});
}

/// @nodoc
class _$BookContentCopyWithImpl<$Res, $Val extends BookContent>
    implements $BookContentCopyWith<$Res> {
  _$BookContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? learningId = null,
    Object? problemSets = null,
    Object? bookmarks = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      learningId: null == learningId
          ? _value.learningId
          : learningId // ignore: cast_nullable_to_non_nullable
              as String,
      problemSets: null == problemSets
          ? _value.problemSets
          : problemSets // ignore: cast_nullable_to_non_nullable
              as List<ProblemSet>,
      bookmarks: null == bookmarks
          ? _value.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookContentCopyWith<$Res>
    implements $BookContentCopyWith<$Res> {
  factory _$$_BookContentCopyWith(
          _$_BookContent value, $Res Function(_$_BookContent) then) =
      __$$_BookContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String learningId,
      List<ProblemSet> problemSets,
      List<String> bookmarks});
}

/// @nodoc
class __$$_BookContentCopyWithImpl<$Res>
    extends _$BookContentCopyWithImpl<$Res, _$_BookContent>
    implements _$$_BookContentCopyWith<$Res> {
  __$$_BookContentCopyWithImpl(
      _$_BookContent _value, $Res Function(_$_BookContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? learningId = null,
    Object? problemSets = null,
    Object? bookmarks = null,
  }) {
    return _then(_$_BookContent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      learningId: null == learningId
          ? _value.learningId
          : learningId // ignore: cast_nullable_to_non_nullable
              as String,
      problemSets: null == problemSets
          ? _value._problemSets
          : problemSets // ignore: cast_nullable_to_non_nullable
              as List<ProblemSet>,
      bookmarks: null == bookmarks
          ? _value._bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_BookContent implements _BookContent {
  _$_BookContent(
      {required this.id,
      required this.learningId,
      required final List<ProblemSet> problemSets,
      required final List<String> bookmarks})
      : _problemSets = problemSets,
        _bookmarks = bookmarks;

  @override
  final String id;
  @override
  final String learningId;
  final List<ProblemSet> _problemSets;
  @override
  List<ProblemSet> get problemSets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_problemSets);
  }

  final List<String> _bookmarks;
  @override
  List<String> get bookmarks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarks);
  }

  @override
  String toString() {
    return 'BookContent(id: $id, learningId: $learningId, problemSets: $problemSets, bookmarks: $bookmarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookContent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.learningId, learningId) ||
                other.learningId == learningId) &&
            const DeepCollectionEquality()
                .equals(other._problemSets, _problemSets) &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      learningId,
      const DeepCollectionEquality().hash(_problemSets),
      const DeepCollectionEquality().hash(_bookmarks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookContentCopyWith<_$_BookContent> get copyWith =>
      __$$_BookContentCopyWithImpl<_$_BookContent>(this, _$identity);
}

abstract class _BookContent implements BookContent {
  factory _BookContent(
      {required final String id,
      required final String learningId,
      required final List<ProblemSet> problemSets,
      required final List<String> bookmarks}) = _$_BookContent;

  @override
  String get id;
  @override
  String get learningId;
  @override
  List<ProblemSet> get problemSets;
  @override
  List<String> get bookmarks;
  @override
  @JsonKey(ignore: true)
  _$$_BookContentCopyWith<_$_BookContent> get copyWith =>
      throw _privateConstructorUsedError;
}
