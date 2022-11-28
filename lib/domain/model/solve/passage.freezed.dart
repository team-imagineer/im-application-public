// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'passage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Passage {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get sequenceNumber => throw _privateConstructorUsedError;

  String? get explanationUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PassageCopyWith<Passage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassageCopyWith<$Res> {
  factory $PassageCopyWith(Passage value, $Res Function(Passage) then) =
      _$PassageCopyWithImpl<$Res, Passage>;

  @useResult
  $Res call(
      {String id, String imageUrl, int sequenceNumber, String? explanationUrl});
}

/// @nodoc
class _$PassageCopyWithImpl<$Res, $Val extends Passage>
    implements $PassageCopyWith<$Res> {
  _$PassageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? sequenceNumber = null,
    Object? explanationUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      explanationUrl: freezed == explanationUrl
          ? _value.explanationUrl
          : explanationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PassageCopyWith<$Res> implements $PassageCopyWith<$Res> {
  factory _$$_PassageCopyWith(
          _$_Passage value, $Res Function(_$_Passage) then) =
      __$$_PassageCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String id, String imageUrl, int sequenceNumber, String? explanationUrl});
}

/// @nodoc
class __$$_PassageCopyWithImpl<$Res>
    extends _$PassageCopyWithImpl<$Res, _$_Passage>
    implements _$$_PassageCopyWith<$Res> {
  __$$_PassageCopyWithImpl(_$_Passage _value, $Res Function(_$_Passage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? sequenceNumber = null,
    Object? explanationUrl = freezed,
  }) {
    return _then(_$_Passage(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      explanationUrl: freezed == explanationUrl
          ? _value.explanationUrl
          : explanationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Passage implements _Passage {
  _$_Passage(
      {required this.id,
      required this.imageUrl,
      required this.sequenceNumber,
      this.explanationUrl});

  @override
  final String id;
  @override
  final String imageUrl;
  @override
  final int sequenceNumber;
  @override
  final String? explanationUrl;

  @override
  String toString() {
    return 'Passage(id: $id, imageUrl: $imageUrl, sequenceNumber: $sequenceNumber, explanationUrl: $explanationUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Passage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                other.sequenceNumber == sequenceNumber) &&
            (identical(other.explanationUrl, explanationUrl) ||
                other.explanationUrl == explanationUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, imageUrl, sequenceNumber, explanationUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PassageCopyWith<_$_Passage> get copyWith =>
      __$$_PassageCopyWithImpl<_$_Passage>(this, _$identity);
}

abstract class _Passage implements Passage {
  factory _Passage(
      {required final String id,
      required final String imageUrl,
      required final int sequenceNumber,
      final String? explanationUrl}) = _$_Passage;

  @override
  String get id;

  @override
  String get imageUrl;

  @override
  int get sequenceNumber;

  @override
  String? get explanationUrl;

  @override
  @JsonKey(ignore: true)
  _$$_PassageCopyWith<_$_Passage> get copyWith =>
      throw _privateConstructorUsedError;
}
