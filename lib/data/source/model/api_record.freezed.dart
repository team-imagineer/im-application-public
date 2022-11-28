// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiRecord {
  DateTime get timestamp => throw _privateConstructorUsedError;
  HttpMethod get method => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  Map<String, String>? get headers => throw _privateConstructorUsedError;
  Object? get body => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiRecordCopyWith<ApiRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiRecordCopyWith<$Res> {
  factory $ApiRecordCopyWith(ApiRecord value, $Res Function(ApiRecord) then) =
      _$ApiRecordCopyWithImpl<$Res, ApiRecord>;
  @useResult
  $Res call(
      {DateTime timestamp,
      HttpMethod method,
      String path,
      Map<String, String>? headers,
      Object? body});
}

/// @nodoc
class _$ApiRecordCopyWithImpl<$Res, $Val extends ApiRecord>
    implements $ApiRecordCopyWith<$Res> {
  _$ApiRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? method = null,
    Object? path = null,
    Object? headers = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as HttpMethod,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      headers: freezed == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      body: freezed == body ? _value.body : body,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiRecordCopyWith<$Res> implements $ApiRecordCopyWith<$Res> {
  factory _$$_ApiRecordCopyWith(
          _$_ApiRecord value, $Res Function(_$_ApiRecord) then) =
      __$$_ApiRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime timestamp,
      HttpMethod method,
      String path,
      Map<String, String>? headers,
      Object? body});
}

/// @nodoc
class __$$_ApiRecordCopyWithImpl<$Res>
    extends _$ApiRecordCopyWithImpl<$Res, _$_ApiRecord>
    implements _$$_ApiRecordCopyWith<$Res> {
  __$$_ApiRecordCopyWithImpl(
      _$_ApiRecord _value, $Res Function(_$_ApiRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? method = null,
    Object? path = null,
    Object? headers = freezed,
    Object? body = freezed,
  }) {
    return _then(_$_ApiRecord(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as HttpMethod,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      headers: freezed == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      body: freezed == body ? _value.body : body,
    ));
  }
}

/// @nodoc

class _$_ApiRecord implements _ApiRecord {
  _$_ApiRecord(
      {required this.timestamp,
      required this.method,
      required this.path,
      final Map<String, String>? headers,
      this.body})
      : _headers = headers;

  @override
  final DateTime timestamp;
  @override
  final HttpMethod method;
  @override
  final String path;
  final Map<String, String>? _headers;
  @override
  Map<String, String>? get headers {
    final value = _headers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final Object? body;

  @override
  String toString() {
    return 'ApiRecord(timestamp: $timestamp, method: $method, path: $path, headers: $headers, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiRecord &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            const DeepCollectionEquality().equals(other.body, body));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      timestamp,
      method,
      path,
      const DeepCollectionEquality().hash(_headers),
      const DeepCollectionEquality().hash(body));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiRecordCopyWith<_$_ApiRecord> get copyWith =>
      __$$_ApiRecordCopyWithImpl<_$_ApiRecord>(this, _$identity);
}

abstract class _ApiRecord implements ApiRecord {
  factory _ApiRecord(
      {required final DateTime timestamp,
      required final HttpMethod method,
      required final String path,
      final Map<String, String>? headers,
      final Object? body}) = _$_ApiRecord;

  @override
  DateTime get timestamp;
  @override
  HttpMethod get method;
  @override
  String get path;
  @override
  Map<String, String>? get headers;
  @override
  Object? get body;
  @override
  @JsonKey(ignore: true)
  _$$_ApiRecordCopyWith<_$_ApiRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
