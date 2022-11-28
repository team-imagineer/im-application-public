import 'dart:io';

import 'package:im_application/data/source/model/result.dart';
import 'package:im_application/domain/repository/bookmark_repository.dart';

import '../source/api.dart';

class BookmarkRepositoryImpl extends BookmarkRepository {
  final Api api;

  BookmarkRepositoryImpl(this.api);

  @override
  Future<Result<List<String>>> getBookmarkedProblemsIdInBook(
      String accessToken, String bookId) async {
    final result = await api.get(
      "/books/$bookId/questions/bookmark",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) {
          return Result.success(data.cast<String>());
        },
        error: (error) => Result.error(error));
  }

  @override
  Future<Result<bool>> isBookmarked(
      String accessToken, String problemId) async {
    // TODO: implement isBookmarked
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> makeBookmarked(
      String accessToken, String problemId) async {
    final result = await api.put(
      "/questions/$problemId/bookmark",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) {
          return const Result.success(null);
        },
        error: (error) => Result.error(error));
  }

  @override
  Future<Result<void>> cancelBookmarked(
      String accessToken, String problemId) async {
    final result = await api.delete(
      "/questions/$problemId/bookmark",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) {
          return const Result.success(null);
        },
        error: (error) => Result.error(error));
  }
}
