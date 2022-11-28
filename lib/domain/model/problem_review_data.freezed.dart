// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'problem_review_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProblemReviewData {
  ProblemData get problemData => throw _privateConstructorUsedError;
  List<bool> get corrections => throw _privateConstructorUsedError;
  List<SolveHistory> get histories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProblemReviewDataCopyWith<ProblemReviewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemReviewDataCopyWith<$Res> {
  factory $ProblemReviewDataCopyWith(
          ProblemReviewData value, $Res Function(ProblemReviewData) then) =
      _$ProblemReviewDataCopyWithImpl<$Res, ProblemReviewData>;
  @useResult
  $Res call(
      {ProblemData problemData,
      List<bool> corrections,
      List<SolveHistory> histories});

  $ProblemDataCopyWith<$Res> get problemData;
}

/// @nodoc
class _$ProblemReviewDataCopyWithImpl<$Res, $Val extends ProblemReviewData>
    implements $ProblemReviewDataCopyWith<$Res> {
  _$ProblemReviewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problemData = null,
    Object? corrections = null,
    Object? histories = null,
  }) {
    return _then(_value.copyWith(
      problemData: null == problemData
          ? _value.problemData
          : problemData // ignore: cast_nullable_to_non_nullable
              as ProblemData,
      corrections: null == corrections
          ? _value.corrections
          : corrections // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      histories: null == histories
          ? _value.histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<SolveHistory>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProblemDataCopyWith<$Res> get problemData {
    return $ProblemDataCopyWith<$Res>(_value.problemData, (value) {
      return _then(_value.copyWith(problemData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProblemReviewDataCopyWith<$Res>
    implements $ProblemReviewDataCopyWith<$Res> {
  factory _$$_ProblemReviewDataCopyWith(_$_ProblemReviewData value,
          $Res Function(_$_ProblemReviewData) then) =
      __$$_ProblemReviewDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProblemData problemData,
      List<bool> corrections,
      List<SolveHistory> histories});

  @override
  $ProblemDataCopyWith<$Res> get problemData;
}

/// @nodoc
class __$$_ProblemReviewDataCopyWithImpl<$Res>
    extends _$ProblemReviewDataCopyWithImpl<$Res, _$_ProblemReviewData>
    implements _$$_ProblemReviewDataCopyWith<$Res> {
  __$$_ProblemReviewDataCopyWithImpl(
      _$_ProblemReviewData _value, $Res Function(_$_ProblemReviewData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? problemData = null,
    Object? corrections = null,
    Object? histories = null,
  }) {
    return _then(_$_ProblemReviewData(
      problemData: null == problemData
          ? _value.problemData
          : problemData // ignore: cast_nullable_to_non_nullable
              as ProblemData,
      corrections: null == corrections
          ? _value._corrections
          : corrections // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      histories: null == histories
          ? _value._histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<SolveHistory>,
    ));
  }
}

/// @nodoc

class _$_ProblemReviewData implements _ProblemReviewData {
  _$_ProblemReviewData(
      {required this.problemData,
      required final List<bool> corrections,
      required final List<SolveHistory> histories})
      : _corrections = corrections,
        _histories = histories;

  @override
  final ProblemData problemData;
  final List<bool> _corrections;
  @override
  List<bool> get corrections {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_corrections);
  }

  final List<SolveHistory> _histories;
  @override
  List<SolveHistory> get histories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_histories);
  }

  @override
  String toString() {
    return 'ProblemReviewData(problemData: $problemData, corrections: $corrections, histories: $histories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProblemReviewData &&
            (identical(other.problemData, problemData) ||
                other.problemData == problemData) &&
            const DeepCollectionEquality()
                .equals(other._corrections, _corrections) &&
            const DeepCollectionEquality()
                .equals(other._histories, _histories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      problemData,
      const DeepCollectionEquality().hash(_corrections),
      const DeepCollectionEquality().hash(_histories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProblemReviewDataCopyWith<_$_ProblemReviewData> get copyWith =>
      __$$_ProblemReviewDataCopyWithImpl<_$_ProblemReviewData>(
          this, _$identity);
}

abstract class _ProblemReviewData implements ProblemReviewData {
  factory _ProblemReviewData(
      {required final ProblemData problemData,
      required final List<bool> corrections,
      required final List<SolveHistory> histories}) = _$_ProblemReviewData;

  @override
  ProblemData get problemData;
  @override
  List<bool> get corrections;
  @override
  List<SolveHistory> get histories;
  @override
  @JsonKey(ignore: true)
  _$$_ProblemReviewDataCopyWith<_$_ProblemReviewData> get copyWith =>
      throw _privateConstructorUsedError;
}
