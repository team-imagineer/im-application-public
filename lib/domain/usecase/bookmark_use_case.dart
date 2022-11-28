import 'package:im_application/domain/repository/bookmark_repository.dart';

import '../../data/source/model/result.dart';
import '../../main.dart';
import '../manager/user_manager.dart';

class BookmarkUseCase {
  final BookmarkRepository repository;
  final UserManager userManager;

  BookmarkUseCase(this.repository, this.userManager);

  Future<Result<bool>> isBookmarked(String problemId) async {
    final token = await userManager.getToken();
    return await repository.isBookmarked(token!.accessToken!, problemId);
  }

  Future<Result<void>> makeBookmarked(String problemId) async {
    final token = await userManager.getToken();
    mixpanel?.track("makeBookmark", properties: {"problemId": problemId});
    return await repository.makeBookmarked(token!.accessToken!, problemId);
  }

  Future<Result<void>> cancelBookmarked(String problemId) async {
    final token = await userManager.getToken();
    mixpanel?.track("cancelBookmark", properties: {"problemId": problemId});
    return await repository.cancelBookmarked(token!.accessToken!, problemId);
  }
}
