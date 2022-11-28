import '../../data/source/model/result.dart';
import '../model/book.dart';
import '../model/learning.dart';
import '../model/solve/book_content.dart';

abstract class MyBookRepository {
  Future<Result<List<Book>>> getMyBooks(
      String userId, String accessToken, Sort sortBy);

  Future<Result<List<Book>>> getMyWorkbooks(
      String userId, String accessToken, Sort sortBy);

  Future<Result<List<Learning>>> getLearnings(
      String accessToken, String bookId);

  Future<Result<Learning>> makeLearning(String accessToken, String bookId);

  Future<Result<BookContent>> getBookDetail(
      String accessToken, String bookId, String learningId);

  Future<Result<void>> deleteMyBook(String accessToken, String bookId);

  Future<Result<void>> deleteMyWorkbook(String accessToken, String bookId);

  Future<Result<void>> deleteLearning(
      String accessToken, String bookId, String learningId);
}
