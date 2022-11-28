import 'dart:io';

import 'package:im_application/data/repository/util/model_maker.dart';
import 'package:im_application/data/source/model/result.dart';
import 'package:im_application/domain/model/book.dart';

import '../../domain/model/problem_data.dart';
import '../../domain/repository/explore_book_repository.dart';
import '../source/api.dart';

class ExploreBookRepositoryImpl implements ExploreBookRepository {
  static const int booksPerPage = 15;
  static const int problemsPerPage = 10;

  final Api api;
  final ModelMaker modelMaker;

  ExploreBookRepositoryImpl(this.api, this.modelMaker);

  @override
  Future<Result<List<Book>>> getBooks(
      String accessToken, List<String> filters, int page) async {
    final result = await api.get(
      "/books?order=ASC&page=$page&take=$booksPerPage${filters.isNotEmpty ? "&" : ""}${filters.join("&")}",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) {
          data = data["data"];
          return Result.success(
            List.generate(
              data.length,
              (index) => modelMaker.makeBook(data: data[index]),
            ),
          );
        },
        error: (error) => Result.error(error));
  }

  @override
  Future<Result<List<ProblemData>>> getProblems(
      String accessToken, List<String> filters, int page) async {
    final result = await api.get(
      "/questions?order=ASC&page=$page&take=$problemsPerPage${filters.isNotEmpty ? "&" : ""}${filters.join("&")}",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) {
          data = data["data"];
          return Result.success(
            List.generate(
              data.length,
              (index) => modelMaker.makeProblemData(data: data[index]),
            ),
          );
        },
        error: (error) => Result.error(error));
  }

  @override
  Future<Result<bool>> addBook(String accessToken, String bookId) async {
    final result = await api.put(
      "/bookshelves/books/$bookId",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) {
          return const Result.success(true);
        },
        error: (error) => Result.error(error));
  }
}
