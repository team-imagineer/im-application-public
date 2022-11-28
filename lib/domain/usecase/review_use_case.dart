import 'package:im_application/domain/manager/user_manager.dart';
import 'package:im_application/domain/model/filter/filter_row.dart';
import 'package:im_application/domain/repository/review_repository.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../data/source/model/result.dart';
import '../../main.dart';
import '../model/book.dart';
import '../model/problem_review_data.dart';
import '../model/solve/book_content.dart';

class ReviewUseCase {
  UserManager userManager;
  ReviewRepository repository;

  ReviewUseCase(this.repository, this.userManager);

  Future<Result<Book>> makeWorkbook(List<String> problems, String name) async {
    final token = await userManager.getToken();
    final result = repository.makeWorkbook(token!.accessToken!, name, problems);

    mixpanel?.track("makeWorkbook", properties: {"size": problems.length});

    return result;
  }

  Future<Result<BookContent>> startReview(List<String> problems) async {
    final token = await userManager.getToken();
    mixpanel?.track("startLearning", properties: {"problems": problems});
    return repository
        .startReview(token!.accessToken!, {"questionIds": problems});
  }

  Future<Result<List<ProblemReviewData>>> getProblems(
      List<FilterRow> filterData, PickerDateRange? dateRange, int page) async {
    final token = await userManager.getToken();
    List<String> filterResults = [];

    for (final filterRow in filterData) {
      final items = filterRow.getSelectedItemList();

      if (items.isNotEmpty) {
        filterResults
            .add("${filterRow.id}=${items.map((e) => e.id).join(",")}");
      }
    }

    if (dateRange != null) {
      if (dateRange.startDate != null) {
        filterResults
            .add("startedAt=${dateRange.startDate!.toIso8601String()}");
      }
      if (dateRange.endDate != null) {
        filterResults.add(
            "endedAt=${dateRange.endDate!.add(const Duration(days: 1)).toIso8601String()}");
      }
    }

    final result =
        repository.getProblems(token!.accessToken!, filterResults, page);

    mixpanel?.track("viewWorkbookList", properties: {"page": page});

    return result;
  }
}
