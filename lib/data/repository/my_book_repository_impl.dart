import 'dart:io';

import 'package:im_application/data/repository/util/model_maker.dart';
import 'package:im_application/data/source/model/result.dart';
import 'package:im_application/domain/model/book.dart';
import 'package:im_application/domain/model/solve/book_content.dart';
import 'package:im_application/domain/repository/my_book_repository.dart';

import '../../domain/model/learning.dart';
import '../source/api.dart';
import '../source/database_helper.dart';

class MyBookRepositoryImpl implements MyBookRepository {
  final Api api;
  final DatabaseHelper databaseHelper;
  final ModelMaker modelMaker;

  MyBookRepositoryImpl(this.api, this.databaseHelper, this.modelMaker);

  @override
  Future<Result<List<Book>>> getMyBooks(
      String userId, String accessToken, Sort sortBy) async {
    final result = await api.get(
      "/bookshelves/books",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) {
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
  Future<Result<List<Book>>> getMyWorkbooks(
      String userId, String accessToken, Sort sortBy) async {
    final result = await api.get(
      "/bookshelves/workbooks",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) {
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
  Future<Result<List<Learning>>> getLearnings(
      String accessToken, String bookId) async {
    final result = await api.get(
      "/books/$bookId/sessions",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) async {
          List<Learning> learnings = [];

          for (final content in data) {
            final status = Status.fromString(content["workflowState"]);

            if (status == Status.complete) {
              learnings.add(modelMaker.makeLearning(data: content));
            } else {
              // 진행 중인 경우, 걸린 시간을 로컬에서 불러옴.
              final result = await databaseHelper.getStatusRecord(
                learningId: content["id"],
                bookId: bookId,
              );

              learnings.add(
                modelMaker.makeLearning(
                  data: content,
                  localElapsed: result.isNotEmpty
                      ? result[0]["duration"]
                      : content["elapsed"],
                ),
              );
            }
          }
          return Result.success(learnings);
        },
        error: (error) => Result.error(error));
  }

  @override
  Future<Result<Learning>> makeLearning(
      String accessToken, String bookId) async {
    final result = await api.post(
      "/books/$bookId/sessions",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) => Result.success(modelMaker.makeLearning(data: data)),
        error: (error) => Result.error(error));
  }

  @override
  Future<Result<void>> deleteLearning(
      String accessToken, String bookId, String learningId) async {
    final result = await api.delete(
      "/books/$bookId/sessions/$learningId",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    databaseHelper.deletePassageRecord(bookId, learningId);
    databaseHelper.deleteSolveRecord(bookId, learningId);
    databaseHelper.deleteStatusRecord(bookId, learningId);

    return result.when(
      success: (data) => const Result.success(null),
      error: (error) => Result.error(error),
    );
  }

  @override
  Future<Result<void>> deleteMyBook(String accessToken, String bookId) async {
    final result = await api.delete(
      "/bookshelves/books/$bookId",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    databaseHelper.deletePassageRecord(bookId, null);
    databaseHelper.deleteSolveRecord(bookId, null);
    databaseHelper.deleteStatusRecord(bookId, null);

    return result.when(
      success: (data) => const Result.success(null),
      error: (error) => Result.error(error),
    );
  }

  @override
  Future<Result<void>> deleteMyWorkbook(
      String accessToken, String bookId) async {
    final result = await api.delete(
      "/bookshelves/workbooks/$bookId",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    databaseHelper.deletePassageRecord(bookId, null);
    databaseHelper.deleteSolveRecord(bookId, null);
    databaseHelper.deleteStatusRecord(bookId, null);

    return result.when(
      success: (data) => const Result.success(null),
      error: (error) => Result.error(error),
    );
  }

  @override
  Future<Result<BookContent>> getBookDetail(
      String accessToken, String bookId, String learningId) async {
    final result = await api.get(
      "/books/$bookId/contents",
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return result.when(
        success: (data) {
          return Result.success(
            modelMaker.makeBookContent(
              data: data,
              bookId: bookId,
              learningId: learningId,
            ),
          );
        },
        error: (error) => Result.error(error));
  }
}
