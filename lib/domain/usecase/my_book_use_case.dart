import 'package:im_application/domain/model/solve/book_content.dart';

import '../../data/source/model/result.dart';
import '../../main.dart';
import '../manager/user_manager.dart';
import '../model/book.dart';
import '../model/learning.dart';
import '../repository/my_book_repository.dart';

class MyBookUseCase {
  final MyBookRepository repository;
  final UserManager userManager;

  MyBookUseCase(this.repository, this.userManager);

  Future<Result<List<Book>>> getMyBooks(Sort sortBy) async {
    final token = await userManager.getToken();
    final result = repository.getMyBooks(
        userManager.user!.id, token!.accessToken!, sortBy);

    mixpanel?.track("viewMyBookList", properties: {"sort": sortBy.name});

    return result;
  }

  Future<Result<List<Book>>> getMyWorkbooks(Sort sortBy) async {
    final token = await userManager.getToken();
    final result = repository.getMyWorkbooks(
        userManager.user!.id, token!.accessToken!, sortBy);

    mixpanel?.track("viewMyWorkbookList", properties: {"sort": sortBy.name});

    return result;
  }

  Future<Result<List<Learning>>> getLearnings(Book book) async {
    final token = await userManager.getToken();
    mixpanel?.track("viewLearningList", properties: {"bookId": book.id});
    return repository.getLearnings(token!.accessToken!, book.id);
  }

  Future<Result<BookContent>> getBookDetailByLearning(
      Book book, Learning learning) async {
    final token = await userManager.getToken();
    mixpanel?.track("startLearning", properties: {"bookId": book.id});
    return repository.getBookDetail(token!.accessToken!, book.id, learning.id);
  }

  Future<Result<void>> deleteMyBook(Book book) async {
    final token = await userManager.getToken();
    mixpanel?.track("deleteBook", properties: {"bookId": book.id});
    return repository.deleteMyBook(token!.accessToken!, book.id);
  }

  Future<Result<void>> deleteMyWorkbook(Book book) async {
    final token = await userManager.getToken();
    mixpanel?.track("deleteWorkbook", properties: {"bookId": book.id});
    return repository.deleteMyWorkbook(token!.accessToken!, book.id);
  }

  Future<Result<void>> deleteMyLearning(Book book, String learningId) async {
    final token = await userManager.getToken();
    mixpanel?.track("deleteSession", properties: {"bookId": book.id});
    return repository.deleteLearning(token!.accessToken!, book.id, learningId);
  }

  Future<Result<Learning>> makeNewLearning(Book book) async {
    final token = await userManager.getToken();
    mixpanel?.track("makeLearning", properties: {"bookId": book.id});
    return repository.makeLearning(token!.accessToken!, book.id);
  }
}
