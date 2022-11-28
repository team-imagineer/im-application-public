// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainState {
  int get nowPageIndex => throw _privateConstructorUsedError;
  int get nowBottomBarIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call({int nowPageIndex, int nowBottomBarIndex});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nowPageIndex = null,
    Object? nowBottomBarIndex = null,
  }) {
    return _then(_value.copyWith(
      nowPageIndex: null == nowPageIndex
          ? _value.nowPageIndex
          : nowPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      nowBottomBarIndex: null == nowBottomBarIndex
          ? _value.nowBottomBarIndex
          : nowBottomBarIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainStateCopyWith<$Res> implements $MainStateCopyWith<$Res> {
  factory _$$_MainStateCopyWith(
          _$_MainState value, $Res Function(_$_MainState) then) =
      __$$_MainStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int nowPageIndex, int nowBottomBarIndex});
}

/// @nodoc
class __$$_MainStateCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$_MainState>
    implements _$$_MainStateCopyWith<$Res> {
  __$$_MainStateCopyWithImpl(
      _$_MainState _value, $Res Function(_$_MainState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nowPageIndex = null,
    Object? nowBottomBarIndex = null,
  }) {
    return _then(_$_MainState(
      nowPageIndex: null == nowPageIndex
          ? _value.nowPageIndex
          : nowPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      nowBottomBarIndex: null == nowBottomBarIndex
          ? _value.nowBottomBarIndex
          : nowBottomBarIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MainState implements _MainState {
  _$_MainState({required this.nowPageIndex, required this.nowBottomBarIndex});

  @override
  final int nowPageIndex;
  @override
  final int nowBottomBarIndex;

  @override
  String toString() {
    return 'MainState(nowPageIndex: $nowPageIndex, nowBottomBarIndex: $nowBottomBarIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainState &&
            (identical(other.nowPageIndex, nowPageIndex) ||
                other.nowPageIndex == nowPageIndex) &&
            (identical(other.nowBottomBarIndex, nowBottomBarIndex) ||
                other.nowBottomBarIndex == nowBottomBarIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nowPageIndex, nowBottomBarIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainStateCopyWith<_$_MainState> get copyWith =>
      __$$_MainStateCopyWithImpl<_$_MainState>(this, _$identity);
}

abstract class _MainState implements MainState {
  factory _MainState(
      {required final int nowPageIndex,
      required final int nowBottomBarIndex}) = _$_MainState;

  @override
  int get nowPageIndex;
  @override
  int get nowBottomBarIndex;
  @override
  @JsonKey(ignore: true)
  _$$_MainStateCopyWith<_$_MainState> get copyWith =>
      throw _privateConstructorUsedError;
}
