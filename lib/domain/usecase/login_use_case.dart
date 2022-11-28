import '../../data/source/model/result.dart';
import '../../main.dart';
import '../manager/user_manager.dart';
import '../model/token_info.dart';
import '../repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;
  final UserManager userManager;

  LoginUseCase(this.repository, this.userManager);

  /// 로그인
  Future<Result<TokenInfo>> signIn() async {
    TokenInfo? tokenInfo = await userManager.getToken();
    mixpanel?.track("Login", properties: {"method": "seodaang"});

    // 1. 저장된 토큰이 없는 경우
    if (tokenInfo == null) {
      return const Result.error(ApiError.requestError);
    }
    // 2. 저장된 엑세스 토큰이 없는 경우
    else if (tokenInfo.accessToken == null) {
      final result = await repository.refreshTokens(tokenInfo.refreshToken);
      return result.when(
          success: (token) => _validateToken(token),
          error: (error) => Result.error(error));
    }
    // 3. 토큰이 이미 있는 경우
    else {
      return _validateToken(tokenInfo);
    }
  }

  /// 탈퇴
  Future<Result<void>> deleteUser() async {
    final token = await userManager.getToken();
    mixpanel?.track("Quit");

    if (token != null) {
      final result = await repository.deleteUser(token.accessToken!);
      return result.when(
        success: (v) {
          userManager.clearAll();
          return Result.success(v);
        },
        error: (error) => Result.error(error),
      );
    } else {
      return const Result.error(ApiError.authError);
    }
  }

  /// 로그아웃
  void signOut() {
    userManager.clearToken();
  }

  /// 카카오 로그인
  Future<Result<TokenInfo>> signInWithKakao() async {
    mixpanel?.track("Login", properties: {"method": "kakao"});

    final result = await repository.signInWithKakao();
    return result.when(
      success: (token) => _validateToken(token),
      error: (error) => Result.error(error),
    );
  }

  /// 구글 로그인
  Future<Result<TokenInfo>> signInWithGoogle() async {
    mixpanel?.track("Login", properties: {"method": "google"});

    final result = await repository.signInWithGoogle();
    return result.when(
      success: (token) => _validateToken(token),
      error: (error) => Result.error(error),
    );
  }

  /// 애플 로그인
  Future<Result<TokenInfo>> signInWithApple() async {
    mixpanel?.track("Login", properties: {"method": "apple"});

    final result = await repository.signInWithApple();
    return result.when(
      success: (token) => _validateToken(token),
      error: (error) => Result.error(error),
    );
  }

  Future<Result<TokenInfo>> _validateToken(TokenInfo tokenInfo) async {
    final result = await repository.getUserInfo(tokenInfo.accessToken!);
    return result.when(
      success: (user) {
        userManager.setToken(tokenInfo);
        userManager.user = user;
        return Result.success(tokenInfo);
      },
      error: (error) => Result.error(error),
    );
  }
}
