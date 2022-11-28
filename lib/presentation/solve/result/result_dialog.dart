import 'package:flutter/material.dart';
import 'package:im_application/presentation/solve/result/result_state.dart';
import 'package:im_application/presentation/solve/result/result_view_model.dart';
import 'package:im_application/presentation/solve/solve_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../ui/service_colors.dart';
import '../../common/info_circle.dart';
import '../../common/seodaang_dialog.dart';
import '../../main/main_view_model.dart';
import '../widgets/problem_jump_dialog.dart';

class ResultDialog extends StatefulWidget {
  final bool isDarkMode;

  const ResultDialog({Key? key, this.isDarkMode = false}) : super(key: key);

  @override
  State<ResultDialog> createState() => _ResultDialogState();
}

class _ResultDialogState extends State<ResultDialog> {
  @override
  Widget build(BuildContext context) {
    final solveViewModel = context.read<SolveViewModel>();
    final resultViewModel = context.watch<ResultViewModel>();

    return SeodaangDialog(
      title: _getTitle(resultViewModel),
      content: _getContent(solveViewModel, resultViewModel),
      onPositiveClicked: _getOnPositiveClicked(solveViewModel, resultViewModel),
      onNegativeClicked: _getOnNegativeClicked(solveViewModel, resultViewModel),
      positiveText: _getPositiveText(resultViewModel),
      negativeText: _getNegativeText(resultViewModel),
      backgroundColor: resultViewModel.state.dialogState == DialogState.finished
          ? Theme.of(context).extension<ServiceColors>()!.backgroundGrey
          : null,
    );
  }

  String _getTitle(ResultViewModel resultViewModel) {
    switch (resultViewModel.state.dialogState) {
      case DialogState.initial:
        return "채점하기";
      case DialogState.onLoading:
        return "채점을 진행하고 있습니다.";
      case DialogState.finished:
        return "학습 결과";
    }
  }

  Widget? _getContent(
      SolveViewModel solveViewModel, ResultViewModel resultViewModel) {
    switch (resultViewModel.state.dialogState) {
      case DialogState.initial:
        final unsolvedCount = solveViewModel.getAllProblems().length -
            solveViewModel.state!.answers.length;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (unsolvedCount > 0)
              SeodaangDialogText(
                "풀지 않은 $unsolvedCount개의 문제는 오답 처리됩니다.",
                color: Theme.of(context).extension<ServiceColors>()!.textRed,
              ),
            if (unsolvedCount > 0) const SizedBox(height: 3),
            const SeodaangDialogText("정말로 채점을 진행하시겠습니까?"),
          ],
        );
      case DialogState.onLoading:
        return Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Lottie.asset(
            widget.isDarkMode
                ? "assets/animations/check_dark.json"
                : "assets/animations/check.json",
            width: 200,
            height: 200,
          ),
        );
      case DialogState.finished:
        final solveResult = resultViewModel.solveResult;
        final keys = List.from(solveResult!.isCorrect.keys);
        final size = MediaQuery.of(context).size;

        return Container(
          width: size.width - 50,
          height: size.height - 300,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "결과 요약",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context)
                                  .extension<ServiceColors>()!
                                  .borderGrey!),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context)
                              .extension<ServiceColors>()!
                              .white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: infoBox(
                                  "점수",
                                  "${resultViewModel.state.totalScore}점",
                                  "총 ${solveResult.isCorrect.length}문제 중",
                                  "${solveResult.correctCount}문제 정답",
                                  Theme.of(context)
                                      .extension<ServiceColors>()!
                                      .rightBlue!,
                                ),
                              ),
                            ),
                            VerticalDivider(
                              color: Theme.of(context)
                                  .extension<ServiceColors>()!
                                  .buttonBorderGrey,
                              indent: 25,
                              endIndent: 25,
                            ),
                            Expanded(
                              child: Center(
                                child: infoBox(
                                  "소요시간",
                                  "${solveViewModel.state!.solveDuration ~/ 60}:${solveViewModel.state!.solveDuration % 60}",
                                  "소요시간",
                                  "${solveViewModel.state!.solveDuration ~/ 60}분 ${solveViewModel.state!.solveDuration % 60}초",
                                  Theme.of(context)
                                      .extension<ServiceColors>()!
                                      .buttonOrange!,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "문제별 결과",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  _CheckBox(
                    text: "오답만 보기",
                    isChecked: resultViewModel.state.showOnlyWrongProblems,
                    onTap: () {
                      resultViewModel.pressShowOnlyWrongProblemsCheckBox();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ProblemGrid(
                  onlyCorrect: resultViewModel.state.showOnlyWrongProblems,
                  isDarkMode: widget.isDarkMode,
                ),
              ),
            ],
          ),
        );
    }
  }

  Widget infoBox(
    String circleTitle,
    String circleContent,
    String descTitle,
    String descContent,
    Color circleColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InfoCircle(
          circleTitle: circleTitle,
          circleContent: circleContent,
          circleColor: circleColor,
          width: 90,
        ),
        const SizedBox(width: 25),
        Wrap(
          direction: Axis.vertical,
          children: [
            Text(
              descTitle,
              style: TextStyle(
                color: Theme.of(context).extension<ServiceColors>()!.textBlack,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
            Text(
              descContent,
              style: TextStyle(
                color: Theme.of(context).extension<ServiceColors>()!.textBlack,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        )
      ],
    );
  }

  Function() _getOnPositiveClicked(
      SolveViewModel solveViewModel, ResultViewModel resultViewModel) {
    switch (resultViewModel.state.dialogState) {
      case DialogState.initial:
        return () {
          resultViewModel.executeScoring(solveViewModel, widget.isDarkMode);
        };
      case DialogState.onLoading:
        return () {};
      case DialogState.finished:
        return () {
          Navigator.of(context).pop();
        };
    }
  }

  Function() _getOnNegativeClicked(
      SolveViewModel solveViewModel, ResultViewModel resultViewModel) {
    switch (resultViewModel.state.dialogState) {
      case DialogState.initial:
        return () {
          Navigator.of(context).pop();
        };
      case DialogState.onLoading:
        return () {};
      case DialogState.finished:
        return () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          context.read<MainViewModel>().setBottomBarIndex(context, 1);
          solveViewModel.end();
        };
    }
  }

  String _getPositiveText(ResultViewModel resultViewModel) {
    switch (resultViewModel.state.dialogState) {
      case DialogState.initial:
        return "채점하기";
      case DialogState.onLoading:
        return "";
      case DialogState.finished:
        return "해설보기";
    }
  }

  String _getNegativeText(ResultViewModel resultViewModel) {
    switch (resultViewModel.state.dialogState) {
      case DialogState.initial:
        return "취소하기";
      case DialogState.onLoading:
        return "";
      case DialogState.finished:
        return "종료하기";
    }
  }
}

class _CheckBox extends StatelessWidget {
  final String text;
  final bool isChecked;
  final Function() onTap;

  const _CheckBox({
    Key? key,
    required this.text,
    required this.isChecked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Wrap(
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: isChecked
                    ? Theme.of(context)
                        .extension<ServiceColors>()!
                        .buttonOrange!
                    : Theme.of(context)
                        .extension<ServiceColors>()!
                        .buttonBorderGrey!,
              ),
              color: isChecked
                  ? Theme.of(context).extension<ServiceColors>()!.buttonOrange
                  : Theme.of(context).extension<ServiceColors>()!.white,
            ),
            child: Center(
              child: isChecked
                  ? Icon(
                      Icons.check,
                      size: 13,
                      color:
                          Theme.of(context).extension<ServiceColors>()!.white,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).extension<ServiceColors>()!.textBlack,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
