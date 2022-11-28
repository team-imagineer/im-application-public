import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:im_application/presentation/common/ox_tile.dart';
import 'package:im_application/presentation/solve/solve_state.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/solve/problem.dart';
import '../../../ui/manager/theme_manager.dart';
import '../../../ui/service_colors.dart';
import '../../common/seodaang_dialog.dart';
import '../solve_view_model.dart';

class ProblemJumpDialog extends StatelessWidget {
  final bool isDarkMode;

  const ProblemJumpDialog(this.isDarkMode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SeodaangDialog(
      title: "문제 바로가기",
      content: SizedBox(
        width: size.width - 50,
        height: size.height - 250,
        child: ProblemGrid(
          isDarkMode: isDarkMode,
        ),
      ),
      positiveText: "",
      negativeText: "닫기",
      onNegativeClicked: () {
        Navigator.pop(context);
      },
    );
  }
}

class ProblemGrid extends StatelessWidget {
  final bool onlyCorrect;
  final bool isDarkMode;

  const ProblemGrid({
    Key? key,
    this.onlyCorrect = false,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SolveViewModel>();
    final solveMode = viewModel.state!.solveMode;
    final problemSets = viewModel.content!.problemSets;
    final List<Widget> problemWidgets = [];
    final width = MediaQuery.of(context).size.width - 50;
    final count = width ~/ 230;

    for (int index = 0; index < problemSets.length; index++) {
      for (final problem in problemSets[index].problems) {
        if (solveMode == SolveMode.result) {
          final isCorrect =
              viewModel.state!.answers[problem.id] == problem.correctAnswer;

          if (onlyCorrect && isCorrect) {
            continue;
          }
        }

        problemWidgets.add(
          GestureDetector(
            onTap: () {
              viewModel.jump(index);
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context)
                        .extension<ServiceColors>()!
                        .borderGrey!),
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).extension<ServiceColors>()!.white,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    width: double.infinity,
                    child: Wrap(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${problem.indexNumber}번",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            _ProblemInfo(
                              viewModel: viewModel,
                              problem: problem,
                            ),
                          ],
                        ),
                        if (problem.category != null ||
                            problem.lowCategory != null)
                          const SizedBox(height: 3, width: double.infinity),
                        if (problem.category != null)
                          _Tag(
                              problem.category!,
                              Theme.of(context)
                                  .extension<ServiceColors>()!
                                  .buttonLightGrey!,
                              Theme.of(context)
                                  .extension<ServiceColors>()!
                                  .textBlack!),
                        if (problem.category != null &&
                            problem.lowCategory != null)
                          const SizedBox(width: 3),
                        if (problem.lowCategory != null)
                          _Tag(
                              problem.lowCategory!,
                              Theme.of(context)
                                  .extension<ServiceColors>()!
                                  .buttonLightGrey!,
                              Theme.of(context)
                                  .extension<ServiceColors>()!
                                  .textBlack!),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: (width - 110) / (5 * count / 3) - 80,
                      imageUrl: problem.question.imageUrl,
                      placeholder: (context, url) => const SizedBox(),
                      errorWidget: (context, url, error) => const SizedBox(),
                      fadeInDuration: const Duration(milliseconds: 0),
                      fadeOutDuration: const Duration(milliseconds: 0),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                      imageBuilder: (context, imageProvider) {
                        final image = Image(
                          image: imageProvider,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.fitWidth,
                        );
                        if (isDarkMode) {
                          return ColorFiltered(
                            colorFilter: ThemeManager.reverseFilter,
                            child: image,
                          );
                        } else {
                          return image;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        childAspectRatio: 5 / 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: problemWidgets.length,
      itemBuilder: (context, index) => problemWidgets[index],
    );
  }
}

class _ProblemInfo extends StatelessWidget {
  final SolveViewModel viewModel;
  final Problem problem;

  const _ProblemInfo({
    Key? key,
    required this.viewModel,
    required this.problem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (viewModel.state?.solveMode == SolveMode.result) {
      return OXTile(
        isO: viewModel.state!.answers[problem.id] == problem.correctAnswer,
        size: 9,
      );
    } else if (viewModel.state?.answers[problem.id] != null) {
      return CircleAvatar(
        radius: 11,
        backgroundColor:
            Theme.of(context).extension<ServiceColors>()!.textBlack,
        child: CircleAvatar(
          radius: 10,
          backgroundColor: Theme.of(context).extension<ServiceColors>()!.white,
          child: Text(
            "${viewModel.state!.answers[problem.id]}",
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).extension<ServiceColors>()!.textBlack,
            ),
          ),
        ),
      );
    }
    return const Text("❗️");
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const _Tag(this.text, this.backgroundColor, this.textColor, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: backgroundColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 8,
          color: textColor,
        ),
      ),
    );
  }
}
