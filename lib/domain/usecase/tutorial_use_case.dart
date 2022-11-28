import 'package:im_application/domain/manager/user_manager.dart';

class TutorialUseCase {
  final UserManager userManager;

  TutorialUseCase(this.userManager);

  Future<bool> needTutorials() async {
    return userManager.needTutorials();
  }

  Future<void> closeTutorials() async {
    return userManager.setTutorialsAsViewed();
  }

  Future<bool> needSolvingTutorials() async {
    return userManager.needSolvingTutorials();
  }

  Future<void> closeSolvingTutorials() async {
    return userManager.setSolvingTutorialsAsViewed();
  }
}
