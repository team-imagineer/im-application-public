import 'dart:async';
import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:im_application/domain/model/token_info.dart';
import 'package:im_application/domain/model/user_info.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../domain/repository/login_repository.dart';
import '../source/api.dart';
import '../source/database_helper.dart';
import '../source/kakao_api.dart';
import '../source/model/result.dart';

class LoginRepositoryImpl implements LoginRepository {
  final Api api;
  final KakaoApi kakaoApi;
  final DatabaseHelper databaseHelper;

  LoginRepositoryImpl(this.api, this.kakaoApi, this.databaseHelper);

  @override
  Future<Result<void>> deleteUser(String accessToken) async {
    final result = await api.delete(
      "/auth",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (_) async {
          await databaseHelper.clear();
          return Result.success(_);
        },
        error: (e) => Result.error(e));
  }

  @override
  Future<Result<UserInfo>> getUserInfo(String accessToken) async {
    final result = await api.get(
      "/auth",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) {
          final id = data["id"];
          final name = data["username"];
          final email = data["email"];
          final provider = LoginProvider.fromString(data["provider"]);
          final userInfo = UserInfo(
            id: id,
            userName: name,
            email: email,
            provider: provider,
          );
          return Result.success(userInfo);
        },
        error: (error) => Result.error(error));
  }

  @override
  Future<Result<TokenInfo>> signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);

      final appleToken = credential.identityToken;
      final result = await api.post("/auth/apple", headers: {
        HttpHeaders.authorizationHeader: "Bearer $appleToken"
      }, body: {
        "credential": appleToken,
      });

      return result.when(
        success: (data) {
          final accessToken = data["accessToken"];
          final refreshToken = data["refreshToken"];
          final tokenInfo =
              TokenInfo(accessToken: accessToken, refreshToken: refreshToken);
          return Result.success(tokenInfo);
        },
        error: (error) => Result.error(error),
      );
    } catch (e) {
      print(e);
      return const Result.error(ApiError.authError);
    }
  }

  @override
  Future<Result<TokenInfo>> signInWithGoogle() async {
    try {
      final credential = await GoogleSignIn().signIn();
      final googleToken = (await credential!.authentication).idToken;

      final result = await api.post("/auth/google", headers: {
        HttpHeaders.authorizationHeader: "Bearer $googleToken"
      }, body: {
        "credential": googleToken,
      });

      return result.when(
        success: (data) {
          final accessToken = data["accessToken"];
          final refreshToken = data["refreshToken"];
          final tokenInfo =
              TokenInfo(accessToken: accessToken, refreshToken: refreshToken);
          return Result.success(tokenInfo);
        },
        error: (error) => Result.error(error),
      );
    } catch (e) {
      print(e);
      return const Result.error(ApiError.authError);
    }
  }

  @override
  Future<Result<TokenInfo>> signInWithKakao() async {
    try {
      final result = await kakaoApi.getKakaoToken();
      return result.when(
        success: (kakaoToken) async {
          final result = await api.post("/auth/kakao", headers: {
            HttpHeaders.authorizationHeader: "Bearer $kakaoToken"
          }, body: {
            "credential": kakaoToken,
          });

          return result.when(
            success: (data) {
              final accessToken = data["accessToken"];
              final refreshToken = data["refreshToken"];
              final tokenInfo = TokenInfo(
                  accessToken: accessToken, refreshToken: refreshToken);
              return Result.success(tokenInfo);
            },
            error: (error) => Result.error(error),
          );
        },
        error: (error) => Result.error(error),
      );
    } catch (e) {
      print(e);
      return const Result.error(ApiError.authError);
    }
  }

  @override
  Future<Result<TokenInfo>> refreshTokens(String refreshToken) async {
    final result = await api.post("/auth/token/refresh",
        headers: {HttpHeaders.authorizationHeader: "Bearer $refreshToken"});

    return result.when(
        success: (data) {
          final accessToken = data["accessToken"];
          final refreshToken = data["refreshToken"];
          final tokenInfo =
              TokenInfo(accessToken: accessToken, refreshToken: refreshToken);
          return Result.success(tokenInfo);
        },
        error: (error) => Result.error(error));
  }
}
