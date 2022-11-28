import 'package:flutter/material.dart';
import 'package:im_application/domain/usecase/tutorial_use_case.dart';
import 'package:im_application/ui/service_assets.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../ui/service_colors.dart';
import '../explore/explore_problem_screen.dart';
import '../explore/explore_screen.dart';
import '../my_book/my_book_screen.dart';
import '../review/review_screen.dart';
import '../setting/setting_screen.dart';
import 'main_state.dart';

class MainViewModel with ChangeNotifier {
  final TutorialUseCase useCase;
  bool isInitialized = false;

  MainViewModel(this.useCase);

  final pages = <Widget>[
    const ExploreScreen(),
    const ExploreProblemScreen(),
    const MyBookScreen(),
    const ReviewScreen(),
    const SettingScreen(),
  ];

  final pageNames = [
    "문제집",
    "워크북",
    "내 서재",
    "복습하기",
    "설정",
  ];

  final pageTitles = [
    "어떤 문제집을 풀어볼까요?",
    "어떤 문제를 풀어볼까요?",
    "내 문제집과\n워크북을 확인해보세요.",
    "학습 기록을 확인하고\n바로 복습해보세요.",
    "설정",
  ];

  final bottomPageNames = [
    "탐색하기",
    "내 서재",
    "복습하기",
    "설정",
  ];

  final bottomPageChildren = [
    [0, 1],
    [2],
    [3],
    [4]
  ];

  final bottomPageIconPaths = [
    ServiceAssets.exploreIcon,
    ServiceAssets.bookIcon,
    ServiceAssets.reviewIcon,
    ServiceAssets.settingIcon,
  ];

  final bottomPageActiveIconPaths = [
    ServiceAssets.exploreActiveIcon,
    ServiceAssets.bookActiveIcon,
    ServiceAssets.reviewActiveIcon,
    ServiceAssets.settingActiveIcon,
  ];

  final globalKeys = List.generate(4, (_) => GlobalKey());

  MainState _state = MainState(nowPageIndex: 2, nowBottomBarIndex: 1);

  MainState get state => _state;

  Future<void> init(BuildContext context) async {
    if (!isInitialized) {
      isInitialized = true;
      if (await isFirstVisit()) {
        getTutorial(
          Theme.of(context).extension<ServiceColors>()!.primary!,
          Theme.of(context).extension<ServiceColors>()!.white!,
          Theme.of(context).extension<ServiceColors>()!.disableTextGrey!,
          () {
            setBottomBarIndex(context, 0);
          },
        ).show(context: context);
      }
    }
  }

  void setBottomBarIndex(BuildContext context, int index) {
    _state = _state.copyWith(
        nowPageIndex: bottomPageChildren[index][0], nowBottomBarIndex: index);

    if (index == 1) {
      (pages[2] as MyBookScreen).fetch(context);
    } else if (index == 2) {
      (pages[3] as ReviewScreen).fetch(context);
    }

    notifyListeners();
  }

  void setSubPageIndex(
      BuildContext context, int bottomBarIndex, int subPageIndex) {
    _state = _state.copyWith(
        nowPageIndex: bottomPageChildren[bottomBarIndex][subPageIndex],
        nowBottomBarIndex: bottomBarIndex);

    notifyListeners();
  }

  int getSubPageIndex() {
    return bottomPageChildren[_state.nowBottomBarIndex]
        .indexOf(_state.nowPageIndex);
  }

  List<String> getSubPageNames() {
    return List<String>.from(
        bottomPageChildren[_state.nowBottomBarIndex].map((e) => pageNames[e]));
  }

  Future<bool> isFirstVisit() async {
    return useCase.needTutorials();
  }

  void endTutorial() {
    useCase.closeTutorials();
  }

  // 개선 필요
  TutorialCoachMark getTutorial(
      Color titleColor, Color descColor, Color skipColor, Function()? onTap) {
    RenderBox box =
        globalKeys[0].currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero) - const Offset(0, -5);

    return TutorialCoachMark(
      paddingFocus: 15,
      textStyleSkip: TextStyle(
          color: skipColor, fontSize: 17.0, fontWeight: FontWeight.bold),
      onFinish: () {
        endTutorial();
      },
      onSkip: () {
        endTutorial();
      },
      onClickTarget: (_) {
        onTap?.call();
        endTutorial();
      },
      targets: [
        TargetFocus(
          identify: "탐색하기",
          targetPosition: TargetPosition(box.size, position),
          pulseVariation: Tween(begin: 1.0, end: 0.997),
          contents: [
            TargetContent(
              align: ContentAlign.top,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "문제집 탐색하기",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                      fontSize: 22.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: Text(
                      "이미 존재하는 문제집을 풀거나, 나만의 워크북을 만들어보세요.",
                      style: TextStyle(
                        color: descColor,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
