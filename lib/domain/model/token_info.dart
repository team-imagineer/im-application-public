import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_info.freezed.dart';

@freezed
class TokenInfo with _$TokenInfo {
  factory TokenInfo({
    String? accessToken,
    required String refreshToken,
  }) = _TokenInfo;
}
