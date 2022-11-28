import '../../data/source/model/result.dart';

abstract class BookmarkRepository {
  Future<Result<bool>> isBookmarked(String accessToken, String problemId);

  Future<Result<void>> makeBookmarked(String accessToken, String problemId);

  Future<Result<void>> cancelBookmarked(String accessToken, String problemId);
}
