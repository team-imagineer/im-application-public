import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ui/service_colors.dart';
import '../../ui/service_texts.dart';
import 'init_view_model.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<InitViewModel>();
    viewModel.setUp(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor:
        Theme.of(context).extension<ServiceColors>()!.buttonPrimary,
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      ServiceTexts.subtitle,
                  textStyle: const TextStyle(
                    fontSize: 20.0,
                  ),
                  speed: Duration(
                    milliseconds: 1500 ~/ max(1, ServiceTexts.subtitle.length),
                  ),
                  colors: [
                    Theme.of(context).extension<ServiceColors>()!.textBlack!,
                    Theme.of(context).extension<ServiceColors>()!.textBlack!,
                    Theme.of(context).extension<ServiceColors>()!.primary!,
                    Theme.of(context).extension<ServiceColors>()!.textBlack!,
                    Theme.of(context).extension<ServiceColors>()!.textBlack!,
                  ],
                ),
              ],
              totalRepeatCount: 1,
            ),
                const SizedBox(height: 10),
                Text(
                  ServiceTexts.title,
                  style: TextStyle(
                    fontFamily: "BlackHanSans",
                    fontSize: 80,
                    color: Theme.of(context).extension<ServiceColors>()!.black,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
