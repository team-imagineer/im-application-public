// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'answer_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnswerContent {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get explanationUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerContentCopyWith<AnswerContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerContentCopyWith<$Res> {
  factory $AnswerContentCopyWith(
          AnswerContent value, $Res Function(AnswerContent) then) =
      _$AnswerContentCopyWithImpl<$Res, AnswerContent>;
  @useResult
  $Res call({String id, String imageUrl, String? explanationUrl});
}

/// @nodoc
class _$AnswerContentCopyWithImpl<$Res, $Val extends AnswerContent>
    implements $AnswerContentCopyWith<$Res> {
  _$AnswerContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
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
      explanationUrl: freezed == explanationUrl
          ? _value.explanationUrl
          : explanationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerContentCopyWith<$Res>
    implements $AnswerContentCopyWith<$Res> {
  factory _$$_AnswerContentCopyWith(
          _$_AnswerContent value, $Res Function(_$_AnswerContent) then) =
      __$$_AnswerContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String imageUrl, String? explanationUrl});
}

/// @nodoc
class __$$_AnswerContentCopyWithImpl<$Res>
    extends _$AnswerContentCopyWithImpl<$Res, _$_AnswerContent>
    implements _$$_AnswerContentCopyWith<$Res> {
  __$$_AnswerContentCopyWithImpl(
      _$_AnswerContent _value, $Res Function(_$_AnswerContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? explanationUrl = freezed,
  }) {
    return _then(_$_AnswerContent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      explanationUrl: freezed == explanationUrl
          ? _value.explanationUrl
          : explanationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AnswerContent implements _AnswerContent {
  _$_AnswerContent(
      {required this.id, required this.imageUrl, this.explanationUrl});

  @override
  final String id;
  @override
  final String imageUrl;
  @override
  final String? explanationUrl;

  @override
  String toString() {
    return 'AnswerContent(id: $id, imageUrl: $imageUrl, explanationUrl: $explanationUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerContent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.explanationUrl, explanationUrl) ||
                other.explanationUrl == explanationUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl, explanationUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerContentCopyWith<_$_AnswerContent> get copyWith =>
      __$$_AnswerContentCopyWithImpl<_$_AnswerContent>(this, _$identity);
}

abstract class _AnswerContent implements AnswerContent {
  factory _AnswerContent(
      {required final String id,
      required final String imageUrl,
      final String? explanationUrl}) = _$_AnswerContent;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  String? get explanationUrl;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerContentCopyWith<_$_AnswerContent> get copyWith =>
      throw _privateConstructorUsedError;
}
