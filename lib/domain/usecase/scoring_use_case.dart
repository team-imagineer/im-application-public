import 'package:im_application/data/source/model/result.dart';
import 'package:im_application/domain/model/solve/score.dart';

import '../../main.dart';
import '../manager/user_manager.dart';
import '../repository/scoring_repository.dart';

class ScoringUseCase {
  final ScoringRepository repository;
  final UserManager userManager;

  ScoringUseCase(this.repository, this.userManager);

  Future<Result<bool>> sendBookSolveResult(
      Score solveResult,
      Map<String, int> userAnswers,
      String bookId,
      String learningId,
      bool isDarkMode) async {
    final token = await userManager.getToken();
    final count = solveResult.isCorrect.length;
    final score = count != 0 ? (100 * solveResult.correctCount ~/ count) : 0;

    mixpanel?.track("score", properties: {
      "score": score,
      "correct": solveResult.correctCount,
      "total": count,
      "bookId": bookId,
      "learningId": learningId,
      "isDarkMode": isDarkMode,
    });

    return await repository.sendSolveResult(
      token!.accessToken!,
      bookId,
      learningId,
      solveResult.duration,
      userAnswers,
      solveResult.isCorrect,
      solveResult.score,
    );
  }

  Future<Result<bool>> sendStudySolveResult(
      Score solveResult, Map<String, int> userAnswers, bool isDarkMode) async {
    final token = await userManager.getToken();
    final count = solveResult.isCorrect.length;
    final score = count != 0 ? (100 * solveResult.correctCount ~/ count) : 0;

    mixpanel?.track("score", properties: {
      "score": score,
      "correct": solveResult.correctCount,
      "total": count,
      "type": "review",
      "isDarkMode": isDarkMode,
    });

    return await repository.completeReview(
      token!.accessToken!,
      solveResult.duration,
      userAnswers,
      solveResult.isCorrect,
      solveResult.score,
    );
  }

  Future<bool> canShowInAppReview() async {
    return await userManager.canShowInAppReview();
  }
}
