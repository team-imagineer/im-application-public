// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterItem {
  String get id => throw _privateConstructorUsedError;
  String get showName => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterItemCopyWith<FilterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterItemCopyWith<$Res> {
  factory $FilterItemCopyWith(
          FilterItem value, $Res Function(FilterItem) then) =
      _$FilterItemCopyWithImpl<$Res, FilterItem>;
  @useResult
  $Res call({String id, String showName, bool selected});
}

/// @nodoc
class _$FilterItemCopyWithImpl<$Res, $Val extends FilterItem>
    implements $FilterItemCopyWith<$Res> {
  _$FilterItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? showName = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      showName: null == showName
          ? _value.showName
          : showName // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterItemCopyWith<$Res>
    implements $FilterItemCopyWith<$Res> {
  factory _$$_FilterItemCopyWith(
          _$_FilterItem value, $Res Function(_$_FilterItem) then) =
      __$$_FilterItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String showName, bool selected});
}

/// @nodoc
class __$$_FilterItemCopyWithImpl<$Res>
    extends _$FilterItemCopyWithImpl<$Res, _$_FilterItem>
    implements _$$_FilterItemCopyWith<$Res> {
  __$$_FilterItemCopyWithImpl(
      _$_FilterItem _value, $Res Function(_$_FilterItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? showName = null,
    Object? selected = null,
  }) {
    return _then(_$_FilterItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      showName: null == showName
          ? _value.showName
          : showName // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FilterItem implements _FilterItem {
  _$_FilterItem(
      {required this.id, required this.showName, this.selected = false});

  @override
  final String id;
  @override
  final String showName;
  @override
  @JsonKey()
  final bool selected;

  @override
  String toString() {
    return 'FilterItem(id: $id, showName: $showName, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.showName, showName) ||
                other.showName == showName) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, showName, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterItemCopyWith<_$_FilterItem> get copyWith =>
      __$$_FilterItemCopyWithImpl<_$_FilterItem>(this, _$identity);
}

abstract class _FilterItem implements FilterItem {
  factory _FilterItem(
      {required final String id,
      required final String showName,
      final bool selected}) = _$_FilterItem;

  @override
  String get id;
  @override
  String get showName;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$_FilterItemCopyWith<_$_FilterItem> get copyWith =>
      throw _privateConstructorUsedError;
}
