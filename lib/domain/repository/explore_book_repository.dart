import '../../data/source/model/result.dart';
import '../model/book.dart';
import '../model/problem_data.dart';

abstract class ExploreBookRepository {
  Future<Result<List<Book>>> getBooks(
      String accessToken, List<String> filters, int page);

  Future<Result<List<ProblemData>>> getProblems(
      String accessToken, List<String> filters, int page);

  Future<Result<bool>> addBook(String accessToken, String bookId);
}
