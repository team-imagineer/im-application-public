// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'problem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Problem {
  String get id => throw _privateConstructorUsedError;
  QuestionContent get question => throw _privateConstructorUsedError;
  bool get solvable => throw _privateConstructorUsedError;
  int get sequenceNumber => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get lowCategory => throw _privateConstructorUsedError;
  int? get indexNumber => throw _privateConstructorUsedError;
  int? get correctAnswer => throw _privateConstructorUsedError;
  AnswerContent? get answer => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProblemCopyWith<Problem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemCopyWith<$Res> {
  factory $ProblemCopyWith(Problem value, $Res Function(Problem) then) =
      _$ProblemCopyWithImpl<$Res, Problem>;
  @useResult
  $Res call(
      {String id,
      QuestionContent question,
      bool solvable,
      int sequenceNumber,
      String? category,
      String? lowCategory,
      int? indexNumber,
      int? correctAnswer,
      AnswerContent? answer,
      int? score});

  $QuestionContentCopyWith<$Res> get question;
  $AnswerContentCopyWith<$Res>? get answer;
}

/// @nodoc
class _$ProblemCopyWithImpl<$Res, $Val extends Problem>
    implements $ProblemCopyWith<$Res> {
  _$ProblemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? solvable = null,
    Object? sequenceNumber = null,
    Object? category = freezed,
    Object? lowCategory = freezed,
    Object? indexNumber = freezed,
    Object? correctAnswer = freezed,
    Object? answer = freezed,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionContent,
      solvable: null == solvable
          ? _value.solvable
          : solvable // ignore: cast_nullable_to_non_nullable
              as bool,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      lowCategory: freezed == lowCategory
          ? _value.lowCategory
          : lowCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      indexNumber: freezed == indexNumber
          ? _value.indexNumber
          : indexNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerContent?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionContentCopyWith<$Res> get question {
    return $QuestionContentCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AnswerContentCopyWith<$Res>? get answer {
    if (_value.answer == null) {
      return null;
    }

    return $AnswerContentCopyWith<$Res>(_value.answer!, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProblemCopyWith<$Res> implements $ProblemCopyWith<$Res> {
  factory _$$_ProblemCopyWith(
          _$_Problem value, $Res Function(_$_Problem) then) =
      __$$_ProblemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      QuestionContent question,
      bool solvable,
      int sequenceNumber,
      String? category,
      String? lowCategory,
      int? indexNumber,
      int? correctAnswer,
      AnswerContent? answer,
      int? score});

  @override
  $QuestionContentCopyWith<$Res> get question;
  @override
  $AnswerContentCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$_ProblemCopyWithImpl<$Res>
    extends _$ProblemCopyWithImpl<$Res, _$_Problem>
    implements _$$_ProblemCopyWith<$Res> {
  __$$_ProblemCopyWithImpl(_$_Problem _value, $Res Function(_$_Problem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? solvable = null,
    Object? sequenceNumber = null,
    Object? category = freezed,
    Object? lowCategory = freezed,
    Object? indexNumber = freezed,
    Object? correctAnswer = freezed,
    Object? answer = freezed,
    Object? score = freezed,
  }) {
    return _then(_$_Problem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionContent,
      solvable: null == solvable
          ? _value.solvable
          : solvable // ignore: cast_nullable_to_non_nullable
              as bool,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      lowCategory: freezed == lowCategory
          ? _value.lowCategory
          : lowCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      indexNumber: freezed == indexNumber
          ? _value.indexNumber
          : indexNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerContent?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_Problem implements _Problem {
  _$_Problem(
      {required this.id,
      required this.question,
      required this.solvable,
      required this.sequenceNumber,
      required this.category,
      required this.lowCategory,
      required this.indexNumber,
      required this.correctAnswer,
      required this.answer,
      required this.score});

  @override
  final String id;
  @override
  final QuestionContent question;
  @override
  final bool solvable;
  @override
  final int sequenceNumber;
  @override
  final String? category;
  @override
  final String? lowCategory;
  @override
  final int? indexNumber;
  @override
  final int? correctAnswer;
  @override
  final AnswerContent? answer;
  @override
  final int? score;

  @override
  String toString() {
    return 'Problem(id: $id, question: $question, solvable: $solvable, sequenceNumber: $sequenceNumber, category: $category, lowCategory: $lowCategory, indexNumber: $indexNumber, correctAnswer: $correctAnswer, answer: $answer, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Problem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.solvable, solvable) ||
                other.solvable == solvable) &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                other.sequenceNumber == sequenceNumber) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.lowCategory, lowCategory) ||
                other.lowCategory == lowCategory) &&
            (identical(other.indexNumber, indexNumber) ||
                other.indexNumber == indexNumber) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      solvable,
      sequenceNumber,
      category,
      lowCategory,
      indexNumber,
      correctAnswer,
      answer,
      score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProblemCopyWith<_$_Problem> get copyWith =>
      __$$_ProblemCopyWithImpl<_$_Problem>(this, _$identity);
}

abstract class _Problem implements Problem {
  factory _Problem(
      {required final String id,
      required final QuestionContent question,
      required final bool solvable,
      required final int sequenceNumber,
      required final String? category,
      required final String? lowCategory,
      required final int? indexNumber,
      required final int? correctAnswer,
      required final AnswerContent? answer,
      required final int? score}) = _$_Problem;

  @override
  String get id;
  @override
  QuestionContent get question;
  @override
  bool get solvable;
  @override
  int get sequenceNumber;
  @override
  String? get category;
  @override
  String? get lowCategory;
  @override
  int? get indexNumber;
  @override
  int? get correctAnswer;
  @override
  AnswerContent? get answer;
  @override
  int? get score;
  @override
  @JsonKey(ignore: true)
  _$$_ProblemCopyWith<_$_Problem> get copyWith =>
      throw _privateConstructorUsedError;
}
