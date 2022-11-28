import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_application/presentation/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../ui/service_assets.dart';
import '../../ui/service_colors.dart';
import '../../ui/service_texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();
    viewModel.animate();

    return Scaffold(
      body: Container(
        color: Theme.of(context).extension<ServiceColors>()!.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ServiceTexts.subtitle,
                style: TextStyle(
                  color:
                      Theme.of(context).extension<ServiceColors>()!.textBlack,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                ServiceTexts.title,
                style: TextStyle(
                  fontFamily: "BlackHanSans",
                  color: Theme.of(context).extension<ServiceColors>()!.black,
                  fontSize: 65,
                ),
              ),
              const SizedBox(height: 150),
              AnimatedPadding(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.linear,
                padding: EdgeInsets.only(
                    bottom: viewModel.isUp ? 10 : 0,
                    top: viewModel.isUp ? 0 : 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      ServiceAssets.bubbleBackground,
                      width: 270,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "3초만에 시작하고\n6,000+문제와 함께하세요.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context)
                              .extension<ServiceColors>()!
                              .textBlack,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              _LoginButton(
                svgIconPath: ServiceAssets.kakaoLogoIcon,
                buttonText: "카카오 로그인",
                labelColor:
                    Theme.of(context).extension<ServiceColors>()!.kakaoLabel!,
                buttonColor: Theme.of(context)
                    .extension<ServiceColors>()!
                    .kakaoBackground!,
                onTap: () {
                  viewModel.kakaoLogin(context);
                },
                isLoading: viewModel.state.isLoading,
              ),
              if (Platform.isIOS)
                _LoginButton(
                  svgIconPath: ServiceAssets.googleLogoIcon,
                  labelColor: Theme.of(context)
                      .extension<ServiceColors>()!
                      .googleLabel!,
                  buttonColor: Theme.of(context)
                      .extension<ServiceColors>()!
                      .googleBackground!,
                  buttonText: "Google로 로그인",
                  onTap: () {
                    viewModel.googleLogin(context);
                  },
                  isLoading: viewModel.state.isLoading,
                ),
              if (Platform.isIOS)
                _LoginButton(
                  svgIconPath: ServiceAssets.appleLogoIcon,
                  buttonText: "Apple로 로그인",
                  labelColor:
                      Theme.of(context).extension<ServiceColors>()!.appleLabel!,
                  buttonColor: Theme.of(context)
                      .extension<ServiceColors>()!
                      .appleBackground!,
                  onTap: () {
                    viewModel.appleLogin(context);
                  },
                  isLoading: viewModel.state.isLoading,
                ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: [
                  GestureDetector(
                      child: Text(
                        "개인정보처리방침",
                        style: TextStyle(
                          color: Theme.of(context)
                              .extension<ServiceColors>()!
                              .secondaryTextGrey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        viewModel.showPrivacy(context);
                      }),
                  GestureDetector(
                      child: Text(
                        "문의하기",
                        style: TextStyle(
                          color: Theme.of(context)
                              .extension<ServiceColors>()!
                              .secondaryTextGrey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        viewModel.showInquiry(context);
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  static const double width = 400;
  static const double height = 60;
  static const buttonMargin = EdgeInsets.symmetric(vertical: 5.0);
  static final buttonBorderRadius = BorderRadius.circular(5.0);

  final String svgIconPath;
  final String buttonText;
  final Color labelColor;
  final Color buttonColor;
  final Function() onTap;
  final bool isLoading;

  const _LoginButton({
    Key? key,
    required this.svgIconPath,
    required this.buttonText,
    required this.labelColor,
    required this.buttonColor,
    required this.onTap,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? () {} : onTap,
      child: Container(
        width: width,
        height: height,
        margin: buttonMargin,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: buttonBorderRadius,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).extension<ServiceColors>()!.shadowGrey!,
              blurRadius: 2.0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  isLoading
                      ? SizedBox(
                          width: 25,
                          height: 25,
                          child: SpinKitFadingCircle(
                            color: Theme.of(context)
                                .extension<ServiceColors>()!
                                .buttonOrange,
                            size: 25,
                          ),
                        )
                      : SvgPicture.asset(
                          svgIconPath,
                          height: 25,
                        ),
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: labelColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: isLoading ? 0.5 : 0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: buttonBorderRadius,
                  color:
                      Theme.of(context).extension<ServiceColors>()!.shadowGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
