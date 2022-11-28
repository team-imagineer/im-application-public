import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import '../../domain/usecase/login_use_case.dart';
import '../../main.dart';
import '../../ui/service_texts.dart';
import '../common/error_snack_bar.dart';
import '../common/search_bar.dart';
import '../common/seodaang_dialog.dart';
import '../login/login_screen.dart';
import '../others/lisence/lisence_screen.dart';
import '../others/webview/webview_screen.dart';

class SettingViewModel extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  SettingViewModel(this.loginUseCase) {
    menuActions = [
      (BuildContext context) async {
        final controller = TextEditingController();
        final deviceInfo = await DeviceInfoPlugin().deviceInfo;

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => SeodaangDialog(
            title: "오류 신고",
            content: SearchBar(
              placeHolder: "오류 내용을 입력해주세요.",
              controller: controller,
              showIcon: false,
              maxLine: 10,
            ),
            onPositiveClicked: () {
              mixpanel?.track("userErrorReport", properties: {
                "content": controller.text,
                "device": deviceInfo.toMap(),
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("신고가 완료되었습니다."),
                ),
              );
              Navigator.of(context).pop();
            },
            onNegativeClicked: () {
              Navigator.of(context).pop();
            },
            positiveText: "신고",
            negativeText: "취소",
          ),
        );
      },
      (BuildContext context) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => SeodaangDialog.withText(
            title: "로그아웃",
            text: "정말로 로그아웃 하시겠습니까?",
            onPositiveClicked: () {
              _logout(context);
            },
            onNegativeClicked: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
      (BuildContext context) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => SeodaangDialog.withText(
            title: "회원 탈퇴",
            text: "회원 탈퇴를 진행하면 더이상 서당개를 이용하실 수 없습니다.\n정말로 회원 탈퇴를 진행하시겠습니까?",
            onPositiveClicked: () async {
              final result = await loginUseCase.deleteUser();
              result.when(success: (v) {
                loginUseCase.deleteUser();
                _logout(context);
              }, error: (error) {
                ErrorSnackBar(
                  error: error,
                  context: context,
                ).show(context);
                Navigator.of(context).pop();
              });
            },
            onNegativeClicked: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
      (BuildContext context) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const WebViewScreen(
              title: "개인정보처리방침",
              url: ServiceTexts.privacyUrl,
            ),
          ),
        );
      },
      (BuildContext context) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LicenseScreen(),
          ),
        );
      },
    ];
  }

  final menuTitles = ["오류 신고", "로그아웃", "회원 탈퇴", "개인정보처리방침", "오픈소스 라이선스"];

  // 생성자에서 수정하기
  late final List<Function(BuildContext context)> menuActions;

  void _logout(BuildContext context) {
    loginUseCase.signOut();
    Navigator.of(context).popUntil((route) => false);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void touchBanner(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const WebViewScreen(
          title: "서당개 사용자 설문조사",
          url: ServiceTexts.surveyUrl,
        ),
      ),
    );
  }
}
