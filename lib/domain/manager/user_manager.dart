import 'package:flutter/material.dart';
import 'package:im_application/presentation/login/login_screen.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../data/repository/login_repository_impl.dart';
import '../../data/source/secure_data.dart';
import '../../main.dart';
import '../model/token_info.dart';
import '../model/user_info.dart';

class UserManager {
  final LoginRepositoryImpl repository;
  final SecureData secureData;

  TokenInfo? _token;
  UserInfo? user;

  UserManager(this.secureData, this.repository);

  Future<TokenInfo?> getToken() async {
    if (_token == null) {
      final tokenString = await secureData.getValue("token");
      if (tokenString != null) {
        _token = TokenInfo(refreshToken: tokenString);
      }
    }

    if (_token == null) {
      return null;
    } else if (JwtDecoder.isExpired(_token!.refreshToken)) {
      return null;
    } else if (_token!.accessToken != null &&
        JwtDecoder.isExpired(_token!.accessToken!)) {
      final result = await repository.refreshTokens(_token!.refreshToken);
      return result.when(
          success: (token) => token,
          error: (error) {
            navigatorKey.currentState?.push(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
            return null;
          });
    } else {
      return _token;
    }
  }

  void setToken(TokenInfo token) {
    _token = token;
    secureData.setString("token", token.refreshToken);
  }

  void clearToken() {
    _token = null;
    secureData.remove("token");
  }

  void clearAll() {
    clearToken();
    secureData.remove("review");
    secureData.remove("tutorial");
    secureData.remove("solving-tutorial");
  }

  Future<bool> canShowInAppReview() async {
    final isShown = await secureData.getValue("review");

    if (isShown != null) {
      return false;
    } else {
      secureData.setString("review", "true");
      return await InAppReview.instance.isAvailable();
    }
  }

  Future<bool> needTutorials() async {
    final isShown = await secureData.getValue("tutorial");
    return isShown == null;
  }

  Future<void> setTutorialsAsViewed() async {
    secureData.setString("tutorial", "true");
  }

  Future<bool> needSolvingTutorials() async {
    final isShown = await secureData.getValue("solving-tutorial");
    return isShown == null;
  }

  Future<void> setSolvingTutorialsAsViewed() async {
    secureData.setString("solving-tutorial", "true");
  }
}
