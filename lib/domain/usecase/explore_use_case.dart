import '../../data/source/model/result.dart';
import '../../main.dart';
import '../manager/user_manager.dart';
import '../model/book.dart';
import '../model/filter/filter_row.dart';
import '../model/problem_data.dart';
import '../repository/explore_book_repository.dart';

class ExploreUseCase {
  final ExploreBookRepository repository;
  final UserManager userManager;

  ExploreUseCase(this.repository, this.userManager);

  Future<Result<List<Book>>> getBooks(List<FilterRow> filters, int page) async {
    final token = await userManager.getToken();
    List<String> filterResults = [];

    for (final filterRow in filters) {
      final items = filterRow.getSelectedItemList();

      if (items.isNotEmpty) {
        filterResults
            .add("${filterRow.id}=${items.map((e) => e.id).join(",")}");
      }
    }

    final result =
        repository.getBooks(token!.accessToken!, filterResults, page);

    mixpanel?.track("viewBookList", properties: {"page": page});

    return result;
  }

  Future<Result<List<ProblemData>>> getProblems(
      List<FilterRow> filters, String query, int page) async {
    final token = await userManager.getToken();
    List<String> filterResults = [];

    for (final filterRow in filters) {
      final items = filterRow.getSelectedItemList();

      if (items.isNotEmpty) {
        filterResults
            .add("${filterRow.id}=${items.map((e) => e.id).join(",")}");
      }
    }

    if (query.isNotEmpty) {
      filterResults.add("query=$query");
    }

    final result =
        repository.getProblems(token!.accessToken!, filterResults, page);

    mixpanel?.track("viewWorkbookList", properties: {"page": page});

    return result;
  }

  Future<Result<bool>> addBook(Book book) async {
    final token = await userManager.getToken();
    final result = repository.addBook(token!.accessToken!, book.id);

    mixpanel?.track("addBook", properties: {
      "bookId": book.id,
      "bookTitle": book.title,
      "bookSubject": book.subject
    });

    return result;
  }
}
