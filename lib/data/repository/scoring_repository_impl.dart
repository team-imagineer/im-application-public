import 'dart:io';

import 'package:im_application/data/source/model/result.dart';
import 'package:im_application/domain/repository/scoring_repository.dart';

import '../source/api.dart';

class ScoringRepositoryImpl extends ScoringRepository {
  final Api api;

  ScoringRepositoryImpl(this.api);

  @override
  Future<Result<bool>> sendSolveResult(
    String accessToken,
    String bookId,
    String learningId,
    int elapsed,
    Map<String, int> userAnswer,
    Map<String, bool> isCorrect,
    Map<String, int> score,
  ) async {
    final problems = List.of(isCorrect.keys);
    final result = await api
        .post("/books/$bookId/sessions/$learningId/complete", headers: {
      HttpHeaders.authorizationHeader: "Bearer $accessToken"
    }, body: {
      "elapsed": elapsed,
      "responses": List.generate(
          problems.length,
          (index) => {
                "questionId": problems[index],
                "response": userAnswer[problems[index]].toString(),
                "isCorrect": isCorrect[problems[index]],
                "score": score[problems[index]],
              }),
    });

    return result.when(
        success: (data) => const Result.success(true),
        error: (error) => Result.error(error));
  }

  @override
  Future<Result<bool>> completeReview(
    String accessToken,
    int elapsed,
    Map<String, int> userAnswer,
    Map<String, bool> isCorrect,
    Map<String, int> score,
  ) async {
    final problems = List.of(isCorrect.keys);
    final result = await api.post(
      "/reviews/complete",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
      body: {
        "elapsed": elapsed,
        "responses": List.generate(
          problems.length,
          (index) => {
            "questionId": problems[index],
            "response": userAnswer[problems[index]].toString(),
            "isCorrect": isCorrect[problems[index]],
            "score": score[problems[index]],
          },
        ),
      },
    );

    return result.when(
        success: (data) => const Result.success(true),
        error: (error) => Result.error(error));
  }
}
