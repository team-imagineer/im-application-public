import '../../data/source/model/result.dart';

abstract class ScoringRepository {
  Future<Result<bool>> sendSolveResult(
    String accessToken,
    String bookId,
    String learningId,
    int elapsed,
    Map<String, int> userAnswer,
    Map<String, bool> isCorrect,
    Map<String, int> score,
  );

  Future<Result<bool>> completeReview(
    String accessToken,
    int elapsed,
    Map<String, int> userAnswer,
    Map<String, bool> isCorrect,
    Map<String, int> score,
  );
}
