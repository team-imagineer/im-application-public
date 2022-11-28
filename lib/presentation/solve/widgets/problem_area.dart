import 'package:flutter/material.dart';
import 'package:im_application/presentation/common/animated_cached_network_image.dart';
import 'package:scribble/scribble.dart';

import '../../../ui/service_colors.dart';
import '../../common/answer_input.dart';
import '../solve_state.dart';
import '../solve_view_model.dart';

class ProblemArea extends StatelessWidget {
  final SolveViewModel viewModel;
  final bool isDarkMode;

  const ProblemArea(this.viewModel, this.isDarkMode, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final urls = viewModel.getProblemImageUrls();

    return Expanded(
      child: Center(
        child: Scrollbar(
          controller: viewModel.problemScrollController,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            controller: viewModel.problemScrollController,
            children: List.generate(
              urls.length,
              (index) {
                return _ProblemWidget(
                  pageIndex:
                      viewModel.state != null ? viewModel.state!.nowIndex : 0,
                  viewModel: viewModel,
                  imageUrl: urls[index],
                  problemId: viewModel.getProblemIdByIndex(index),
                  problemIndex: index,
                  isDarkMode: isDarkMode,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ProblemWidget extends StatelessWidget {
  final SolveViewModel viewModel;
  final String imageUrl;
  final String problemId;
  final int pageIndex;
  final int problemIndex;
  final bool isDarkMode;

  const _ProblemWidget(
      {Key? key,
      required this.viewModel,
      required this.imageUrl,
      required this.problemId,
      required this.pageIndex,
      required this.problemIndex,
      required this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScribbleNotifier? notifier =
        viewModel.getProblemScribbleNotifier(pageIndex, problemId);

    return notifier != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: _ProblemHeader(
                  viewModel: viewModel,
                  problemId: problemId,
                  problemIndex: problemIndex,
                ),
              ),
              Stack(
                key: notifier.scribbleKey,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: AnimatedCachedNetworkImage(
                      width: MediaQuery.of(context).size.width / 2,
                      url: imageUrl,
                      isDarkMode: isDarkMode,
                    ),
                  ),
                  _ColorPenImage(
                    viewModel: viewModel,
                    problemId: problemId,
                    problemIndex: problemIndex,
                  ),
                  Positioned.fill(
                    child: Scribble(
                      notifier: notifier,
                      isDarkMode: isDarkMode,
                    ),
                  ),
                ],
              ),
              _ExplanationImage(
                viewModel: viewModel,
                problemId: problemId,
                problemIndex: problemIndex,
                isDarkMode: isDarkMode,
              ),
              AnswerInput(
                isSolving: viewModel.state?.solveMode == SolveMode.solve,
                userInput: viewModel.state?.answers[problemId],
                answer: viewModel.getCorrectAnswer(problemIndex),
                onButtonTap: (n) {
                  viewModel.pressAnswer(problemId, n);
                },
              ),
              const SizedBox(height: 30),
              const Divider(height: 0),
            ],
          )
        : Container(
            width: MediaQuery.of(context).size.width / 2,
          );
  }
}

class _ColorPenImage extends StatelessWidget {
  final SolveViewModel viewModel;
  final String problemId;
  final int problemIndex;

  const _ColorPenImage(
      {Key? key,
      required this.viewModel,
      required this.problemId,
      required this.problemIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (viewModel.state?.solveMode == SolveMode.solve) {
      return const SizedBox();
    } else {
      final isCorrect = viewModel.isCorrect(
          problemIndex, viewModel.state!.answers[problemId]);
      return Image.asset(
        "assets/images/${isCorrect ? "correct" : "wrong"}.png",
        width: 50,
        height: 50,
      );
    }
  }
}

class _ProblemHeader extends StatelessWidget {
  final SolveViewModel viewModel;
  final String problemId;
  final int problemIndex;

  const _ProblemHeader(
      {Key? key,
      required this.viewModel,
      required this.problemId,
      required this.problemIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFirst = problemIndex == 0;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 5, 0),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            IconButton(
              key: isFirst ? viewModel.firstBookmarkIcon : null,
              icon: Icon(
                Icons.bookmark_sharp,
                color: viewModel.isBookmarked(problemId)
                    ? Theme.of(context).extension<ServiceColors>()!.buttonOrange
                    : Theme.of(context).extension<ServiceColors>()!.buttonGrey,
              ),
              onPressed: () {
                viewModel.pressBookmark(problemId);
              },
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
              iconSize: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class _ExplanationImage extends StatelessWidget {
  final SolveViewModel viewModel;
  final String problemId;
  final int problemIndex;
  final bool isDarkMode;

  const _ExplanationImage({
    Key? key,
    required this.viewModel,
    required this.problemId,
    required this.problemIndex,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imageUrl = viewModel.getExplanationImage(problemIndex);

    if (viewModel.state?.solveMode == SolveMode.result && imageUrl != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: AnimatedCachedNetworkImage(
          width: MediaQuery.of(context).size.width / 2,
          url: imageUrl,
          isDarkMode: isDarkMode,
          errorWidget: const SizedBox(),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
