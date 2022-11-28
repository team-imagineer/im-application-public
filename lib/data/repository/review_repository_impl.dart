import 'dart:io';

import 'package:im_application/data/repository/util/model_maker.dart';
import 'package:im_application/data/source/model/result.dart';
import 'package:im_application/domain/model/problem_review_data.dart';
import 'package:im_application/domain/model/solve/book_content.dart';
import 'package:im_application/domain/repository/review_repository.dart';

import '../../domain/model/book.dart';
import '../source/api.dart';

class ReviewRepositoryImpl extends ReviewRepository {
  final Api api;
  final ModelMaker modelMaker;

  ReviewRepositoryImpl(this.api, this.modelMaker);

  @override
  Future<Result<Book>> makeWorkbook(
      String accessToken, String name, List<String> problemIds) async {
    if (problemIds.isEmpty) {
      return const Result.error(ApiError.emptyData);
    }

    final result = await api.post("/bookshelves/workbooks", headers: {
      HttpHeaders.authorizationHeader: "Bearer $accessToken"
    }, body: {
      "title": name,
      "questionIds": problemIds,
    });

    return result.when(
      success: (data) => Result.success(modelMaker.makeBook(data: data)),
      error: (error) => Result.error(error),
    );
  }

  @override
  Future<Result<List<ProblemReviewData>>> getProblems(
      String accessToken, List<String> filters, int page) async {
    final result = await api.get(
      "/reviews/history?order=DESC&page=$page&take=15${filters.isNotEmpty ? "&" : ""}${filters.join("&")}",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) {
          data = data["data"];
          return Result.success(
            List.generate(
              data.length,
              (index) => modelMaker.makeProblemReviewData(data: data[index]),
            ),
          );
        },
        error: (error) => Result.error(error));
  }

  @override
  Future<Result<BookContent>> startReview(
      String accessToken, Map<String, List<String>> problemIds) async {
    if (problemIds.isEmpty) {
      return const Result.error(ApiError.emptyData);
    }

    final result = await api.post(
      "/reviews/start",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
      body: problemIds,
    );

    return result.when(
        success: (data) {
          final target = List.from(data.entries)[0];
          return Result.success(
            modelMaker.makeBookContent(
              data: target.value,
              learningId: target.key,
            ),
          );
        },
        error: (error) => Result.error(error));
  }
}
