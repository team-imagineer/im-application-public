import 'package:flutter/material.dart';
import 'package:im_application/presentation/solve/result/result_state.dart';
import 'package:im_application/presentation/solve/solve_view_model.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../../domain/model/solve/score.dart';
import '../../../domain/usecase/scoring_use_case.dart';

class ResultViewModel extends ChangeNotifier {
  final ScoringUseCase useCase;
  ResultState _state = ResultState(
    isBookmarked: {},
    dialogState: DialogState.initial,
    showOnlyWrongProblems: false,
    totalScore: 0,
    isBook: false,
  );

  Score? solveResult;

  ResultState get state => _state;

  ResultViewModel(this.useCase);

  void init(Map<String, bool> isChecked, bool finished, Score? solveResult,
      bool isBook) {
    this.solveResult = solveResult;
    _state = ResultState(
      isBookmarked: isChecked,
      dialogState: finished ? DialogState.finished : DialogState.initial,
      showOnlyWrongProblems: false,
      totalScore: finished ? getScore() : 0,
      isBook: isBook,
    );
  }

  bool isBookmarked(String problemId) {
    return (_state.isBookmarked[problemId] == true);
  }

  void pressBookmark(String problemId) {
    Map<String, bool> isChecked = Map.of(_state.isBookmarked);
    isChecked[problemId] = (isChecked[problemId] != true);
    _state = _state.copyWith(isBookmarked: isChecked);
    notifyListeners();
  }

  Future<void> executeScoring(
      SolveViewModel solveViewModel, bool isDarkMode) async {
    if (solveResult == null) {
      _state = _state.copyWith(dialogState: DialogState.onLoading);
      solveViewModel.timer?.cancel();
      solveResult = solveViewModel.getSolveResult();

      if (_state.isBook) {
        useCase.sendBookSolveResult(
          solveResult!,
          solveViewModel.state!.answers,
          solveViewModel.content!.id,
          solveViewModel.content!.learningId,
          isDarkMode,
        );
      } else {
        useCase.sendStudySolveResult(
          solveResult!,
          solveViewModel.state!.answers,
          isDarkMode,
        );
      }
      notifyListeners();

      int score = getScore();

      Future.delayed(const Duration(seconds: 3), () {
        _state = _state.copyWith(
            dialogState: DialogState.finished, totalScore: score);
        solveViewModel.changeIntoResultMode();
        notifyListeners();

        Future.delayed(const Duration(seconds: 1), () async {
          if (await useCase.canShowInAppReview()) {
            InAppReview.instance.requestReview();
          }
        });
      });
    }
  }

  void pressShowOnlyWrongProblemsCheckBox() {
    _state =
        _state.copyWith(showOnlyWrongProblems: !_state.showOnlyWrongProblems);
    notifyListeners();
  }

  int getScore() {
    int score = 0;
    for (final key in solveResult!.isCorrect.keys) {
      if (solveResult!.isCorrect[key] == true) {
        if (solveResult!.score[key] != null) {
          score += solveResult!.score[key]!;
        }
      }
    }
    return score;
  }
}
