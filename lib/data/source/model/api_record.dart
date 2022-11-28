import 'package:freezed_annotation/freezed_annotation.dart';

import '../api.dart';

part 'api_record.freezed.dart';

@freezed
class ApiRecord with _$ApiRecord {
  factory ApiRecord({
    required DateTime timestamp,
    required HttpMethod method,
    required String path,
    Map<String, String>? headers,
    Object? body,
  }) = _ApiRecord;
}
