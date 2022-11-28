// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'problem_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProblemSet {
  String get id => throw _privateConstructorUsedError;
  int get sequenceNumber => throw _privateConstructorUsedError;
  List<Problem> get problems => throw _privateConstructorUsedError;
  Passage? get passage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProblemSetCopyWith<ProblemSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemSetCopyWith<$Res> {
  factory $ProblemSetCopyWith(
          ProblemSet value, $Res Function(ProblemSet) then) =
      _$ProblemSetCopyWithImpl<$Res, ProblemSet>;
  @useResult
  $Res call(
      {String id,
      int sequenceNumber,
      List<Problem> problems,
      Passage? passage});

  $PassageCopyWith<$Res>? get passage;
}

/// @nodoc
class _$ProblemSetCopyWithImpl<$Res, $Val extends ProblemSet>
    implements $ProblemSetCopyWith<$Res> {
  _$ProblemSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sequenceNumber = null,
    Object? problems = null,
    Object? passage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      problems: null == problems
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<Problem>,
      passage: freezed == passage
          ? _value.passage
          : passage // ignore: cast_nullable_to_non_nullable
              as Passage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PassageCopyWith<$Res>? get passage {
    if (_value.passage == null) {
      return null;
    }

    return $PassageCopyWith<$Res>(_value.passage!, (value) {
      return _then(_value.copyWith(passage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProblemSetCopyWith<$Res>
    implements $ProblemSetCopyWith<$Res> {
  factory _$$_ProblemSetCopyWith(
          _$_ProblemSet value, $Res Function(_$_ProblemSet) then) =
      __$$_ProblemSetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int sequenceNumber,
      List<Problem> problems,
      Passage? passage});

  @override
  $PassageCopyWith<$Res>? get passage;
}

/// @nodoc
class __$$_ProblemSetCopyWithImpl<$Res>
    extends _$ProblemSetCopyWithImpl<$Res, _$_ProblemSet>
    implements _$$_ProblemSetCopyWith<$Res> {
  __$$_ProblemSetCopyWithImpl(
      _$_ProblemSet _value, $Res Function(_$_ProblemSet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sequenceNumber = null,
    Object? problems = null,
    Object? passage = freezed,
  }) {
    return _then(_$_ProblemSet(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      problems: null == problems
          ? _value._problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<Problem>,
      passage: freezed == passage
          ? _value.passage
          : passage // ignore: cast_nullable_to_non_nullable
              as Passage?,
    ));
  }
}

/// @nodoc

class _$_ProblemSet implements _ProblemSet {
  _$_ProblemSet(
      {required this.id,
      required this.sequenceNumber,
      required final List<Problem> problems,
      this.passage})
      : _problems = problems;

  @override
  final String id;
  @override
  final int sequenceNumber;
  final List<Problem> _problems;
  @override
  List<Problem> get problems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_problems);
  }

  @override
  final Passage? passage;

  @override
  String toString() {
    return 'ProblemSet(id: $id, sequenceNumber: $sequenceNumber, problems: $problems, passage: $passage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProblemSet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                other.sequenceNumber == sequenceNumber) &&
            const DeepCollectionEquality().equals(other._problems, _problems) &&
            (identical(other.passage, passage) || other.passage == passage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, sequenceNumber,
      const DeepCollectionEquality().hash(_problems), passage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProblemSetCopyWith<_$_ProblemSet> get copyWith =>
      __$$_ProblemSetCopyWithImpl<_$_ProblemSet>(this, _$identity);
}

abstract class _ProblemSet implements ProblemSet {
  factory _ProblemSet(
      {required final String id,
      required final int sequenceNumber,
      required final List<Problem> problems,
      final Passage? passage}) = _$_ProblemSet;

  @override
  String get id;
  @override
  int get sequenceNumber;
  @override
  List<Problem> get problems;
  @override
  Passage? get passage;
  @override
  @JsonKey(ignore: true)
  _$$_ProblemSetCopyWith<_$_ProblemSet> get copyWith =>
      throw _privateConstructorUsedError;
}
