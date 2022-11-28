// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_book_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyBookDetailState {
  List<Learning> get learnings => throw _privateConstructorUsedError;

  bool get isEditMode => throw _privateConstructorUsedError;

  Map<String, bool> get isSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyBookDetailStateCopyWith<MyBookDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBookDetailStateCopyWith<$Res> {
  factory $MyBookDetailStateCopyWith(
          MyBookDetailState value, $Res Function(MyBookDetailState) then) =
      _$MyBookDetailStateCopyWithImpl<$Res, MyBookDetailState>;

  @useResult
  $Res call(
      {List<Learning> learnings,
      bool isEditMode,
      Map<String, bool> isSelected});
}

/// @nodoc
class _$MyBookDetailStateCopyWithImpl<$Res, $Val extends MyBookDetailState>
    implements $MyBookDetailStateCopyWith<$Res> {
  _$MyBookDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learnings = null,
    Object? isEditMode = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      learnings: null == learnings
          ? _value.learnings
          : learnings // ignore: cast_nullable_to_non_nullable
              as List<Learning>,
      isEditMode: null == isEditMode
          ? _value.isEditMode
          : isEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyBookDetailStateCopyWith<$Res>
    implements $MyBookDetailStateCopyWith<$Res> {
  factory _$$_MyBookDetailStateCopyWith(_$_MyBookDetailState value,
          $Res Function(_$_MyBookDetailState) then) =
      __$$_MyBookDetailStateCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {List<Learning> learnings,
      bool isEditMode,
      Map<String, bool> isSelected});
}

/// @nodoc
class __$$_MyBookDetailStateCopyWithImpl<$Res>
    extends _$MyBookDetailStateCopyWithImpl<$Res, _$_MyBookDetailState>
    implements _$$_MyBookDetailStateCopyWith<$Res> {
  __$$_MyBookDetailStateCopyWithImpl(
      _$_MyBookDetailState _value, $Res Function(_$_MyBookDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learnings = null,
    Object? isEditMode = null,
    Object? isSelected = null,
  }) {
    return _then(_$_MyBookDetailState(
      learnings: null == learnings
          ? _value._learnings
          : learnings // ignore: cast_nullable_to_non_nullable
              as List<Learning>,
      isEditMode: null == isEditMode
          ? _value.isEditMode
          : isEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value._isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

class _$_MyBookDetailState implements _MyBookDetailState {
  _$_MyBookDetailState(
      {required final List<Learning> learnings,
      required this.isEditMode,
      required final Map<String, bool> isSelected})
      : _learnings = learnings,
        _isSelected = isSelected;

  final List<Learning> _learnings;

  @override
  List<Learning> get learnings {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_learnings);
  }

  @override
  final bool isEditMode;
  final Map<String, bool> _isSelected;

  @override
  Map<String, bool> get isSelected {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isSelected);
  }

  @override
  String toString() {
    return 'MyBookDetailState(learnings: $learnings, isEditMode: $isEditMode, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyBookDetailState &&
            const DeepCollectionEquality()
                .equals(other._learnings, _learnings) &&
            (identical(other.isEditMode, isEditMode) ||
                other.isEditMode == isEditMode) &&
            const DeepCollectionEquality()
                .equals(other._isSelected, _isSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_learnings),
      isEditMode,
      const DeepCollectionEquality().hash(_isSelected));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyBookDetailStateCopyWith<_$_MyBookDetailState> get copyWith =>
      __$$_MyBookDetailStateCopyWithImpl<_$_MyBookDetailState>(
          this, _$identity);
}

abstract class _MyBookDetailState implements MyBookDetailState {
  factory _MyBookDetailState(
      {required final List<Learning> learnings,
      required final bool isEditMode,
      required final Map<String, bool> isSelected}) = _$_MyBookDetailState;

  @override
  List<Learning> get learnings;

  @override
  bool get isEditMode;

  @override
  Map<String, bool> get isSelected;

  @override
  @JsonKey(ignore: true)
  _$$_MyBookDetailStateCopyWith<_$_MyBookDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
