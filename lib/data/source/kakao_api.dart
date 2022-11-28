import 'package:flutter/services.dart';
import 'package:im_application/data/source/model/result.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoApi {
  Future<Result<dynamic>> getKakaoToken() async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        return Result.success(token.accessToken);
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          return const Result.error(ApiError.userCancel);
        }
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          return Result.success(token.accessToken);
        } catch (error) {
          if (error is PlatformException && error.code == 'CANCELED') {
            return const Result.error(ApiError.userCancel);
          }
          return const Result.error(ApiError.networkError);
        }
      }
    } else {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        return Result.success(token.accessToken);
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          return const Result.error(ApiError.userCancel);
        }
        return const Result.error(ApiError.networkError);
      }
    }
  }
}
