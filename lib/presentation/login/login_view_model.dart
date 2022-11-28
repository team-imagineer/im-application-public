import 'dart:async';

import 'package:flutter/material.dart';
import 'package:im_application/presentation/common/error_snack_bar.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../../data/source/model/result.dart';
import '../../domain/model/token_info.dart';
import '../../domain/usecase/login_use_case.dart';
import '../../ui/service_texts.dart';
import '../main/main_screen.dart';
import '../others/webview/webview_screen.dart';
import 'login_state.dart';

class LoginViewModel with ChangeNotifier {
  final LoginUseCase loginUseCase;
  Timer? timer;
  bool isUp = false;

  LoginViewModel(this.loginUseCase);

  LoginState _state = LoginState(isLoading: false);

  LoginState get state => _state;

  void kakaoLogin(BuildContext context) async {
    _login(context, loginUseCase.signInWithKakao());
  }

  void appleLogin(BuildContext context) async {
    _login(context, loginUseCase.signInWithApple());
  }

  void googleLogin(BuildContext context) async {
    _login(context, loginUseCase.signInWithGoogle());
  }

  void _login(
      BuildContext context, Future<Result<TokenInfo>> loginMethod) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final result = await loginMethod;
    result.when(
      success: (token) {
        _state = _state.copyWith(isLoading: false);
        if (timer != null) {
          timer!.cancel();
          timer = null;
        }
        _gotoMainPage(context);
      },
      error: (error) {
        loginUseCase.signOut();
        _state = _state.copyWith(isLoading: false);
        notifyListeners();
        ErrorSnackBar(
          error: error,
          context: context,
        ).show(context);
      },
    );

    await Future.delayed(const Duration(milliseconds: 100));
    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  void _gotoMainPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  void animate() {
    timer ??= Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      isUp = !isUp;
      notifyListeners();
    });
  }

  void showPrivacy(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const WebViewScreen(
          title: "개인정보처리방침",
          url: ServiceTexts.privacyUrl,
        ),
      ),
    );
  }

  void showInquiry(BuildContext context) async {
    Uri url = await TalkApi.instance.channelChatUrl("****");

    try {
      await launchBrowserTab(url);
    } catch (error) {
      ErrorSnackBar(
        error: ApiError.userCancel,
        context: context,
      ).show(context);
    }
  }
}
