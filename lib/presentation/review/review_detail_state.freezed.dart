// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReviewDetailState {
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewDetailStateCopyWith<ReviewDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewDetailStateCopyWith<$Res> {
  factory $ReviewDetailStateCopyWith(
          ReviewDetailState value, $Res Function(ReviewDetailState) then) =
      _$ReviewDetailStateCopyWithImpl<$Res, ReviewDetailState>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$ReviewDetailStateCopyWithImpl<$Res, $Val extends ReviewDetailState>
    implements $ReviewDetailStateCopyWith<$Res> {
  _$ReviewDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewDetailStateCopyWith<$Res>
    implements $ReviewDetailStateCopyWith<$Res> {
  factory _$$_ReviewDetailStateCopyWith(_$_ReviewDetailState value,
          $Res Function(_$_ReviewDetailState) then) =
      __$$_ReviewDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_ReviewDetailStateCopyWithImpl<$Res>
    extends _$ReviewDetailStateCopyWithImpl<$Res, _$_ReviewDetailState>
    implements _$$_ReviewDetailStateCopyWith<$Res> {
  __$$_ReviewDetailStateCopyWithImpl(
      _$_ReviewDetailState _value, $Res Function(_$_ReviewDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_ReviewDetailState(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ReviewDetailState implements _ReviewDetailState {
  _$_ReviewDetailState({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'ReviewDetailState(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewDetailState &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewDetailStateCopyWith<_$_ReviewDetailState> get copyWith =>
      __$$_ReviewDetailStateCopyWithImpl<_$_ReviewDetailState>(
          this, _$identity);
}

abstract class _ReviewDetailState implements ReviewDetailState {
  factory _ReviewDetailState({required final int index}) = _$_ReviewDetailState;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewDetailStateCopyWith<_$_ReviewDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
