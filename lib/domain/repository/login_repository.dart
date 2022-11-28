import 'dart:async';

import '../../data/source/model/result.dart';
import '../model/token_info.dart';
import '../model/user_info.dart';

abstract class LoginRepository {
  Future<Result<TokenInfo>> signInWithKakao();

  Future<Result<TokenInfo>> signInWithGoogle();

  Future<Result<TokenInfo>> signInWithApple();

  Future<Result<TokenInfo>> refreshTokens(String refreshToken);

  Future<Result<UserInfo>> getUserInfo(String accessToken);

  Future<Result<void>> deleteUser(String accessToken);
}
