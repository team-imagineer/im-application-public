import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';

import '../../common/animated_cached_network_image.dart';
import '../solve_state.dart';
import '../solve_view_model.dart';

class PassageArea extends StatelessWidget {
  final SolveViewModel viewModel;
  final bool isDarkMode;

  const PassageArea(this.viewModel, this.isDarkMode, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? url = viewModel.getPassageImageUrl();
    String? expUrl = viewModel.getPassageExplanationImageUrl();
    ScribbleNotifier? notifier = viewModel.getPassageScribbleNotifier();

    if (url != null && notifier != null) {
      return Expanded(
        child: Center(
          child: SingleChildScrollView(
            controller: viewModel.passageScrollController,
            physics: const BouncingScrollPhysics(),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: AnimatedCachedNetworkImage(
                        width: MediaQuery.of(context).size.width / 2,
                        url: url,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                    Positioned.fill(
                      key: notifier.scribbleKey,
                      child: Scribble(
                        notifier: notifier,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ],
                ),
                if (viewModel.state?.solveMode == SolveMode.result &&
                    expUrl != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: AnimatedCachedNetworkImage(
                      width: MediaQuery.of(context).size.width / 2,
                      url: expUrl,
                      isDarkMode: isDarkMode,
                      errorWidget: const SizedBox(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    return Scrollbar(
      controller: viewModel.passageScrollController,
      child: SingleChildScrollView(
        controller: viewModel.passageScrollController,
        child: const SizedBox(),
      ),
    );
  }
}
