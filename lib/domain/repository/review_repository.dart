import '../../data/source/model/result.dart';
import '../model/book.dart';
import '../model/problem_review_data.dart';
import '../model/solve/book_content.dart';

abstract class ReviewRepository {
  Future<Result<List<ProblemReviewData>>> getProblems(
      String accessToken, List<String> filters, int page);

  Future<Result<Book>> makeWorkbook(
      String accessToken, String name, List<String> problemIds);

  Future<Result<BookContent>> startReview(
      String accessToken, Map<String, List<String>> problemIds);
}
