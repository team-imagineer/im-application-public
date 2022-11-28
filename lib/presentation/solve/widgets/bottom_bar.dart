import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_application/presentation/solve/solve_state.dart';

import '../../../ui/service_assets.dart';
import '../../../ui/service_colors.dart';
import '../solve_view_model.dart';

class BottomBar extends StatelessWidget {
  final SolveViewModel viewModel;
  final bool isDarkMode;

  const BottomBar(this.viewModel, this.isDarkMode, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 60,
      width: double.infinity,
      color: Theme.of(context).extension<ServiceColors>()!.darkBackground,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                SvgPicture.asset(
                  ServiceAssets.timerIcon,
                  width: 15,
                ),
                Text(
                  viewModel.getDurationText(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: [
                  if (!viewModel.isFirstPage())
                    Center(
                      child: _RoundButton(
                        text: "<  이전으로",
                        onTap: () {
                          viewModel.previousPage();
                        },
                      ),
                    ),
                ],
              ),
              Wrap(
                spacing: 10,
                children: [
                  Center(
                    child: _RoundButton(
                      key: viewModel.evaluateIcon,
                      text: viewModel.state?.solveMode == SolveMode.solve
                          ? " 채점하기 "
                          : " 결과보기 ",
                      onTap: () {
                        viewModel.executeScoring(context, isDarkMode);
                      },
                      isMajor: true,
                    ),
                  ),
                  if (!viewModel.isLastPage())
                    Center(
                      child: _RoundButton(
                        key: viewModel.nextIcon,
                        text: "다음으로  >",
                        onTap: () {
                          viewModel.nextPage();
                        },
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool isMajor;

  const _RoundButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isMajor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          foregroundColor:
              Theme.of(context).extension<ServiceColors>()!.textBlack!,
          backgroundColor: isMajor
              ? Theme.of(context).extension<ServiceColors>()!.primary
              : Theme.of(context).extension<ServiceColors>()!.white,
          shadowColor: Colors.transparent,
          textStyle: TextStyle(
            fontWeight: isMajor ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
