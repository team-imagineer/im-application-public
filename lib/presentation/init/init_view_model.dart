import 'dart:async';

import 'package:flutter/material.dart';
import 'package:im_application/presentation/login/login_screen.dart';
import 'package:im_application/presentation/main/main_screen.dart';

import '../../domain/usecase/login_use_case.dart';

class InitViewModel extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  InitViewModel(this.loginUseCase);

  Future<void> checkLogined(BuildContext context) async {
    final result = await loginUseCase.signIn();
    result.when(success: (data) {
      Navigator.pushReplacement(
        context,
        _pageRouteBuilderWithFade(const MainScreen()),
      );
    }, error: (error) {
      print(error);
      Navigator.pushReplacement(
        context,
        _pageRouteBuilderWithFade(const LoginScreen()),
      );
    });
  }

  void setUp(BuildContext context) {
    Timer(const Duration(milliseconds: 500), () async {
      await checkLogined(context);
    });
  }

  PageRouteBuilder _pageRouteBuilderWithFade(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (c, a1, a2) => screen,
      transitionsBuilder: (c, anim, a2, child) => FadeTransition(
        opacity: anim,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
