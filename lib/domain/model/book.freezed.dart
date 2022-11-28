// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Book {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  BookType get type => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get grade => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  String? get month => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String id,
      String title,
      BookType type,
      String? subject,
      String? grade,
      String? year,
      String? month});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? subject = freezed,
    Object? grade = freezed,
    Object? year = freezed,
    Object? month = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BookType,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$_BookCopyWith(_$_Book value, $Res Function(_$_Book) then) =
      __$$_BookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      BookType type,
      String? subject,
      String? grade,
      String? year,
      String? month});
}

/// @nodoc
class __$$_BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res, _$_Book>
    implements _$$_BookCopyWith<$Res> {
  __$$_BookCopyWithImpl(_$_Book _value, $Res Function(_$_Book) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? subject = freezed,
    Object? grade = freezed,
    Object? year = freezed,
    Object? month = freezed,
  }) {
    return _then(_$_Book(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BookType,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Book implements _Book {
  _$_Book(
      {required this.id,
      required this.title,
      required this.type,
      required this.subject,
      required this.grade,
      required this.year,
      required this.month});

  @override
  final String id;
  @override
  final String title;
  @override
  final BookType type;
  @override
  final String? subject;
  @override
  final String? grade;
  @override
  final String? year;
  @override
  final String? month;

  @override
  String toString() {
    return 'Book(id: $id, title: $title, type: $type, subject: $subject, grade: $grade, year: $year, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Book &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, type, subject, grade, year, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookCopyWith<_$_Book> get copyWith =>
      __$$_BookCopyWithImpl<_$_Book>(this, _$identity);
}

abstract class _Book implements Book {
  factory _Book(
      {required final String id,
      required final String title,
      required final BookType type,
      required final String? subject,
      required final String? grade,
      required final String? year,
      required final String? month}) = _$_Book;

  @override
  String get id;
  @override
  String get title;
  @override
  BookType get type;
  @override
  String? get subject;
  @override
  String? get grade;
  @override
  String? get year;
  @override
  String? get month;
  @override
  @JsonKey(ignore: true)
  _$$_BookCopyWith<_$_Book> get copyWith => throw _privateConstructorUsedError;
}
