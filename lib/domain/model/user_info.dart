import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  factory UserInfo({
    required String id,
    required String userName,
    required String email,
    required LoginProvider provider,
  }) = _UserInfo;
}

enum LoginProvider {
  kakao,
  google,
  apple,
  email,
  unknown;

  static LoginProvider fromString(String providerText) {
    switch (providerText) {
      case "kakao":
        return LoginProvider.kakao;
      case "google":
        return LoginProvider.google;
      case "apple":
        return LoginProvider.apple;
      case "email":
        return LoginProvider.email;
      default:
        return unknown;
    }
  }
}
