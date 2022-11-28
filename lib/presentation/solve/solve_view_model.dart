import 'dart:async';
import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:im_application/domain/usecase/my_book_use_case.dart';
import 'package:im_application/domain/usecase/tutorial_use_case.dart';
import 'package:im_application/presentation/common/seodaang_dialog.dart';
import 'package:im_application/presentation/main/main_view_model.dart';
import 'package:im_application/presentation/solve/result/result_dialog.dart';
import 'package:im_application/presentation/solve/result/result_view_model.dart';
import 'package:im_application/presentation/solve/solve_state.dart';
import 'package:im_application/presentation/solve/widgets/problem_jump_dialog.dart';
import 'package:provider/provider.dart';
import 'package:scribble/scribble.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../data/source/database_helper.dart';
import '../../domain/model/book.dart';
import '../../domain/model/learning.dart';
import '../../domain/model/sized_stack.dart';
import '../../domain/model/solve/book_content.dart';
import '../../domain/model/solve/passage_record.dart';
import '../../domain/model/solve/problem.dart';
import '../../domain/model/solve/score.dart';
import '../../domain/model/solve/solve_record.dart';
import '../../domain/usecase/bookmark_use_case.dart';
import '../../main.dart';
import '../../ui/service_colors.dart';
import '../common/error_snack_bar.dart';
import '../common/search_bar.dart';

const highlightStroke = 13.0;
const eraserStroke = 10.0;
const boldStroke = 4.5;
const normalStroke = 3.0;
const thinStroke = 1.5;

class SolveViewModel extends ChangeNotifier {
  final MyBookUseCase myBookUseCase;
  final BookmarkUseCase bookmarkUseCase;
  final TutorialUseCase tutorialUseCase;
  final DatabaseHelper db;

  SolveState _state = SolveState(
    nowIndex: 0,
    answers: {},
    solveDuration: 0,
    isBookmarked: {},
    solveMode: SolveMode.solve,
    isPenToolVisible: false,
    isBook: false,
  );

  bool isInitialized = false;
  BookContent? content;
  Learning? learning;
  ScribbleController scribbleController = ScribbleController();
  ScrollController passageScrollController = ScrollController();
  ScrollController problemScrollController = ScrollController();
  Timer? timer;

  GlobalKey problemJumpIcon = GlobalKey();
  GlobalKey firstBookmarkIcon = GlobalKey();
  GlobalKey nextIcon = GlobalKey();
  GlobalKey evaluateIcon = GlobalKey();

  final popUpMenuTitles = ["오류 신고"];

  // 생성자에서 수정하기
  late final List<Function(BuildContext context)> popUpMenuActions;

  SolveViewModel(
      this.myBookUseCase, this.bookmarkUseCase, this.tutorialUseCase, this.db) {
    popUpMenuActions = [
      (BuildContext context) async {
        final controller = TextEditingController();
        final deviceInfo = await DeviceInfoPlugin().deviceInfo;

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => SeodaangDialog(
            title: "오류 신고",
            content: SearchBar(
              placeHolder: "오류 내용을 입력해주세요.",
              controller: controller,
              showIcon: false,
              maxLine: 5,
            ),
            onPositiveClicked: () {
              mixpanel?.track("userErrorReport", properties: {
                "content": controller.text,
                "device": deviceInfo.toMap(),
                "bookId": content?.id,
                "learningId": content?.learningId,
                "page": _state.nowIndex,
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("신고가 완료되었습니다."),
                ),
              );
              Navigator.of(context).pop();
            },
            onNegativeClicked: () {
              Navigator.of(context).pop();
            },
            positiveText: "신고하기",
            negativeText: "취소하기",
          ),
        );
      },
    ];
  }

  SolveState? get state => _state;

  Future<void> init(Book book, Learning learning, SolveMode solveMode,
      BuildContext context) async {
    if (!isInitialized || (content != null && book.id != content!.id)) {
      _reset(learning);

      final result =
          await myBookUseCase.getBookDetailByLearning(book, learning);

      result.when(success: (data) async {
        _init(context, data, solveMode, true);
      }, error: (error) {
        ErrorSnackBar(
          error: error,
          context: context,
        ).show(context);
        Navigator.pop(context);
      });
    }
  }

  void initWithContent(
    BuildContext context,
    BookContent content,
    Learning learning,
    SolveMode solveMode,
  ) {
    if (!isInitialized ||
        (this.content != null && this.content!.id != content.id)) {
      _reset(learning);
      _init(context, content, solveMode, false);
    }
  }

  void _reset(Learning learning) {
    this.learning = learning;
    isInitialized = true;
    scribbleController.reset();

    _state = SolveState(
      nowIndex: 0,
      answers: {},
      solveDuration: 0,
      isBookmarked: {},
      solveMode: SolveMode.solve,
      isPenToolVisible: false,
      isBook: false,
    );
  }

  void _init(
    BuildContext context,
    BookContent content,
    SolveMode solveMode,
    bool isBook,
  ) async {
    _state = _state.copyWith(
      solveMode: solveMode,
      isBook: isBook,
      isBookmarked: {for (var v in content.bookmarks) v: true},
    );
    this.content = content;
    load();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _state = _state.copyWith(solveDuration: _state.solveDuration + 1);
      if (_state.isBook) {
        _saveStatus();
      }
      notifyListeners();
    });

    if (solveMode == SolveMode.result) {
      timer!.cancel();
    }

    if (await isFirstVisit()) {
      await Future.delayed(const Duration(milliseconds: 500));
      getTutorial(
        Theme.of(context).extension<ServiceColors>()!.primary!,
        Theme.of(context).extension<ServiceColors>()!.white!,
        Theme.of(context).extension<ServiceColors>()!.disableTextGrey!,
      ).show(context: context);
    }
  }

  String? getPassageImageUrl() {
    if (content == null) return null;
    return content!.problemSets[_state.nowIndex].passage?.imageUrl;
  }

  String? getPassageExplanationImageUrl() {
    if (content == null) return null;
    return content!.problemSets[_state.nowIndex].passage?.explanationUrl;
  }

  List<String> getProblemImageUrls() {
    if (content == null) return [];

    final data = content!.problemSets[_state.nowIndex].problems;
    return List.generate(data.length, (index) => data[index].question.imageUrl);
  }

  String getProblemIdByIndex(int index) {
    if (content == null) return "";
    return content!.problemSets[_state.nowIndex].problems[index].id;
  }

  String? getExplanationImage(int index) {
    if (content == null) return null;
    return content!
        .problemSets[_state.nowIndex].problems[index].answer!.imageUrl;
  }

  ScribbleNotifier? getPassageScribbleNotifier() {
    if (content == null) return null;

    final passage = content!.problemSets[_state.nowIndex].passage;
    if (passage == null) return null;

    return getPassageScribbleNotifierById(_state.nowIndex, passage.id);
  }

  ScribbleNotifier? getPassageScribbleNotifierById(
      int index, String passageId) {
    if (content == null) return null;

    if (!scribbleController.passageNotifiers.containsKey(passageId)) {
      scribbleController.setPassageScribble(index, passageId, (historyCount) {
        _savePassage(passageId);
        if (historyCount == 1) {
          notifyListeners();
        }
      });
    }

    return scribbleController.passageNotifiers[passageId];
  }

  ScribbleNotifier? getProblemScribbleNotifier(int index, String problemId) {
    if (content == null) return null;

    if (!scribbleController.problemNotifiers.containsKey(problemId)) {
      scribbleController.setProblemScribble(index, problemId, (historyCount) {
        _saveProblem(index, problemId);
        if (historyCount == 1) {
          notifyListeners();
        }
      });
    }

    return scribbleController.problemNotifiers[problemId];
  }

  String getDurationText() {
    return "${_state.solveDuration ~/ 60}분 ${_state.solveDuration % 60}초";
  }

  Map<String, Problem> getAllProblems() {
    Map<String, Problem> result = {};

    for (final problemSet in content!.problemSets) {
      for (final problem in problemSet.problems) {
        result[problem.id] = problem;
      }
    }

    return result;
  }

  bool isCorrect(int index, int? number) {
    return (content != null &&
        _state.solveMode == SolveMode.result &&
        _state.answers.containsKey(getProblemIdByIndex(index)) &&
        content!.problemSets[_state.nowIndex].problems[index].correctAnswer ==
            number);
  }

  int? getCorrectAnswer(int index) {
    if (content != null && _state.solveMode == SolveMode.result) {
      return content!
          .problemSets[_state.nowIndex].problems[index].correctAnswer;
    }
    return null;
  }

  bool isBookmarked(String problemId) {
    return (content != null && _state.isBookmarked[problemId] == true);
  }

  void pressAnswer(String problemId, int number) {
    if (content == null || _state.solveMode == SolveMode.result) return;

    Map<String, int> answers = Map.of(_state.answers);
    answers[problemId] = number;

    _state = _state.copyWith(answers: answers);
    _saveProblem(_state.nowIndex, problemId);
    notifyListeners();
  }

  void pressBookmark(String problemId) {
    if (content == null) return;

    Map<String, bool> newBookmarkMap = Map.of(_state.isBookmarked);
    newBookmarkMap[problemId] = (_state.isBookmarked[problemId] != true);

    if (newBookmarkMap[problemId] == true) {
      bookmarkUseCase.makeBookmarked(problemId);
    } else {
      bookmarkUseCase.cancelBookmarked(problemId);
    }

    _state = _state.copyWith(isBookmarked: newBookmarkMap);
    notifyListeners();
  }

  void previousPage() {
    if (content == null || _state.nowIndex == 0) {
      return;
    }
    _state = _state.copyWith(nowIndex: _state.nowIndex - 1);
    passageScrollController.jumpTo(0);
    problemScrollController.jumpTo(0);
    notifyListeners();
  }

  void nextPage() {
    if (content == null || _state.nowIndex >= content!.problemSets.length - 1) {
      return;
    }
    _state = _state.copyWith(nowIndex: _state.nowIndex + 1);
    passageScrollController.jumpTo(0);
    problemScrollController.jumpTo(0);
    notifyListeners();
  }

  isFirstPage() {
    return content == null || _state.nowIndex == 0;
  }

  isLastPage() {
    return content == null ||
        _state.nowIndex >= content!.problemSets.length - 1;
  }

  void executeScoring(BuildContext context, bool isDarkMode) {
    if (content == null) return;

    final isFinished = (state?.solveMode == SolveMode.result);

    if (state != null) {
      context.read<ResultViewModel>().init(
            _state.isBookmarked,
            isFinished,
            isFinished ? getSolveResult() : null,
            _state.isBook,
          );
      save();
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ResultDialog(isDarkMode: isDarkMode),
    );
  }

  void showAllProblems(BuildContext context, bool isDarkMode) {
    if (content == null) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ProblemJumpDialog(isDarkMode),
    );
  }

  void setScribbleColor(Color color) {
    scribbleController.setColor(color);
    notifyListeners();
  }

  void setScribbleStroke(Stroke stroke) {
    scribbleController.setStroke(stroke);
    notifyListeners();
  }

  void selectEraser() {
    scribbleController.selectEraser();
    notifyListeners();
  }

  bool canUndoPaint() {
    return scribbleController.historyByPage[_state.nowIndex]!.isNotEmpty;
  }

  void undoPaint() {
    final contentIds = [
      ...content!.problemSets[_state.nowIndex].problems.map((e) => e.id),
      if (content!.problemSets[_state.nowIndex].passage != null)
        content!.problemSets[_state.nowIndex].passage!.id,
    ];
    scribbleController.undo(_state.nowIndex, contentIds);
    notifyListeners();
  }

  void deletePaint() {
    if (content == null) return;

    scribbleController
        .deletePassagePaint(content!.problemSets[_state.nowIndex].passage?.id);
    for (var element in content!.problemSets[_state.nowIndex].problems) {
      scribbleController.deleteProblemPaint(element.id);
    }
    scribbleController.addHistory(_state.nowIndex, "all");
    notifyListeners();
  }

  Score getSolveResult() {
    final Map<String, bool> result = {};
    final Map<String, int> score = {};
    final answers = _state.answers;
    int correctCount = 0;

    for (final problem in getAllProblems().values) {
      if (answers.containsKey(problem.id)) {
        if (problem.correctAnswer == answers[problem.id]) {
          result[problem.id] = true;
          correctCount++;
        } else {
          result[problem.id] = false;
        }
      } else {
        result[problem.id] = false;
      }
      score[problem.id] = problem.score ?? 1;
    }

    return Score(
      duration: _state.solveDuration,
      correctCount: correctCount,
      isCorrect: result,
      score: score,
    );
  }

  void finish(BuildContext context) {
    String text = "정말로 종료하시겠습니까?";

    if (!_state.isBook) {
      text += "\n채점되지 않은 기록은 모두 삭제됩니다.";
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SeodaangDialog.withText(
        title: "종료하기",
        text: text,
        onPositiveClicked: () {
          save();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          context.read<MainViewModel>().setBottomBarIndex(context, 1);
          end();
        },
        onNegativeClicked: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void end() {
    isInitialized = false;
    timer?.cancel();
  }

  void jump(int index) {
    _state = _state.copyWith(nowIndex: index);
    notifyListeners();
  }

  void changeIntoResultMode() {
    _state = _state.copyWith(nowIndex: 0, solveMode: SolveMode.result);
    passageScrollController.jumpTo(0);
    problemScrollController.jumpTo(0);
    notifyListeners();
  }

  void _savePassage(String passageId) async {
    final record = PassageRecord(
      id: 0,
      bookId: content!.id,
      learningId: learning!.id,
      passageId: passageId,
      scribbleData: jsonEncode(
        scribbleController.passageNotifiers[passageId]?.currentSketch.toJson(),
      ),
      time: 0,
    );
    db.updatePassageRecord(record);
  }

  void _loadPassage(int index, String passageId, bool needSync) async {
    final records = await db.getPassageRecord(
        bookId: content!.id, learningId: learning!.id, passageId: passageId);

    if (records.isEmpty) {
      db.addPassageRecord(
        PassageRecord(
            id: 0,
            bookId: content!.id,
            learningId: learning!.id,
            passageId: passageId,
            scribbleData: null),
      );
    } else if (needSync) {
      final record = records.last;
      final scribble = record.scribbleData;

      if (scribble != null) {
        getPassageScribbleNotifierById(index, passageId)
            ?.setSketch(sketch: Sketch.fromJson(jsonDecode(scribble)));
      }
    }
  }

  void _saveProblem(int index, String problemId) async {
    final record = SolveRecord(
      id: null,
      bookId: content!.id,
      learningId: learning!.id,
      problemId: problemId,
      answer: _state.answers[problemId],
      scribbleData: jsonEncode(
        scribbleController.problemNotifiers[problemId]?.currentSketch.toJson(),
      ),
    );
    db.updateSolveRecord(record);
  }

  void _loadProblem(int index, String problemId, bool needSync) async {
    final records = await db.getSolveRecord(
        bookId: content!.id, learningId: learning!.id, problemId: problemId);

    if (records.isEmpty) {
      db.addSolveRecord(SolveRecord(
          id: null,
          bookId: content!.id,
          learningId: learning!.id,
          problemId: problemId,
          answer: null,
          scribbleData: null));
    } else if (needSync) {
      final record = records.last;
      final answer = record.answer;
      final scribble = record.scribbleData;

      if (answer != null) {
        final answers = Map.of(_state.answers);
        answers[problemId] = answer;
        _state = _state.copyWith(answers: answers);
      }

      if (scribble != null) {
        getProblemScribbleNotifier(index, problemId)
            ?.setSketch(sketch: Sketch.fromJson(jsonDecode(scribble)));
      }
    }
  }

  void _saveStatus() async {
    if (content == null) {
      return;
    }

    db.updateStatusRecord(content!.id, content!.learningId,
        _state.solveDuration, _state.nowIndex);
  }

  void _loadStatus() async {
    final records = await db.getStatusRecord(
        bookId: content!.id, learningId: content!.learningId);

    if (records.isEmpty) {
      db.addStatusRecord(content!.id, content!.learningId, _state.solveDuration,
          _state.nowIndex);
    } else {
      final record = records.last;
      _state = _state.copyWith(
          solveDuration: record["duration"], nowIndex: record["index"]);
    }

    notifyListeners();
  }

  void load() {
    int index = 0;
    for (final problemSet in content!.problemSets) {
      if (problemSet.passage != null) {
        _loadPassage(index, problemSet.passage!.id, _state.isBook);
      }
      for (final problem in problemSet.problems) {
        _loadProblem(index, problem.id, _state.isBook);
      }
      index++;
    }

    if (_state.isBook) {
      _loadStatus();
      notifyListeners();
    }
  }

  void save() {
    int index = 0;
    for (final problemSet in content!.problemSets) {
      if (problemSet.passage != null) {
        _savePassage(problemSet.passage!.id);
      }
      for (final problem in problemSet.problems) {
        _saveProblem(index, problem.id);
      }
      index++;
    }
  }

  void clickPenTool() {
    _state = _state.copyWith(isPenToolVisible: !_state.isPenToolVisible);
    notifyListeners();
  }

  void changeThemeMode() {
    scribbleController.notifyAll();
  }

  Future<bool> isFirstVisit() async {
    return tutorialUseCase.needSolvingTutorials();
  }

  void endTutorial() {
    tutorialUseCase.closeSolvingTutorials();
  }

  // 개선 필요
  TutorialCoachMark getTutorial(
      Color titleColor, Color descColor, Color skipColor) {
    return TutorialCoachMark(
      paddingFocus: 0,
      textStyleSkip: TextStyle(
          color: skipColor, fontSize: 17.0, fontWeight: FontWeight.bold),
      alignSkip: Alignment.bottomLeft,
      onFinish: () {
        endTutorial();
      },
      onSkip: () {
        endTutorial();
      },
      onClickTarget: (_) {
        endTutorial();
      },
      targets: [
        getTargetFocus("북마크", "기억하고 싶은 문제는 북마크해둘 수 있어요.", titleColor, descColor,
            firstBookmarkIcon, false, false),
        getTargetFocus("문제 바로가기", "모든 문제를 한 눈에 보고 한 번에 이동할 수 있어요.", titleColor,
            descColor, problemJumpIcon, false, true),
        getTargetFocus("다음으로", "페이지의 문제를 모두 풀었다면, 다음 페이지로 이동하세요.", titleColor,
            descColor, nextIcon, true, false),
        getTargetFocus("채점하기", "문제를 다 푸셨다면, 채점은 서당개가 알아서 해드릴게요.", titleColor,
            descColor, evaluateIcon, true, false),
      ],
    );
  }

  TargetFocus getTargetFocus(
    String title,
    String desc,
    Color titleColor,
    Color descColor,
    GlobalKey key,
    bool showOnTop,
    bool showOnLeft,
  ) {
    return TargetFocus(
      identify: title,
      keyTarget: key,
      pulseVariation: Tween(begin: 1.0, end: 0.997),
      contents: [
        TargetContent(
          align: showOnTop ? ContentAlign.top : ContentAlign.bottom,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                showOnLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                  fontSize: 22.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 25),
                child: Text(
                  desc,
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
    );
  }
}

class ScribbleController {
  static const int highlightAlpha = 100;
  static const int historySize = 30;
  final Map<String, ScribbleNotifier> passageNotifiers = {};
  Map<String, ScribbleNotifier> problemNotifiers = {};
  Map<int, SizedStack<String>> historyByPage = {};

  Color _penColor = Colors.black;
  Color _highlightColor = const Color(0xFFFFCC00).withAlpha(highlightAlpha);
  PenType _nowPenType = PenType.pen;
  Stroke _nowStroke = Stroke.strokeThin;

  Color get penColor => _penColor;

  Color get highlightColor => _highlightColor;

  PenType get nowPenType => _nowPenType;

  Stroke get nowStroke => _nowStroke;

  List<ScribbleNotifier> get notifiers =>
      [...passageNotifiers.values, ...problemNotifiers.values];

  void setPassageScribble(
      int index, String id, Function(int historyCount) onPointerUp) {
    passageNotifiers[id] = ScribbleNotifier(
      allowedPointersMode: ScribblePointerMode.penOnly,
      widths: [thinStroke, normalStroke, boldStroke],
    );
    presetScribble(passageNotifiers[id]!, index, id, onPointerUp);
  }

  void setProblemScribble(
      int index, String id, Function(int historyCount) onPointerUp) {
    problemNotifiers[id] = ScribbleNotifier(
      allowedPointersMode: ScribblePointerMode.penOnly,
      widths: [thinStroke, normalStroke, boldStroke],
    );
    presetScribble(problemNotifiers[id]!, index, id, onPointerUp);
  }

  void setColor(Color color) {
    Color newColor = color;
    bool resetWidth = false;

    if (_nowPenType == PenType.highlighter) {
      newColor = color.withAlpha(highlightAlpha);
      _highlightColor = newColor;
    } else {
      _penColor = newColor;
      if (_nowPenType == PenType.eraser) {
        _nowPenType = PenType.pen;
        resetWidth = true;
      }
    }

    for (var notifier in notifiers) {
      notifier.setColor(newColor);
      if (resetWidth) {
        notifier.setStrokeWidth(Stroke.strokeThin.toWidth());
      }
    }
  }

  void setStroke(Stroke stroke) {
    double width = stroke.toWidth();
    _nowStroke = stroke;
    _nowPenType = stroke.toPenType();

    setColor(_nowPenType == PenType.highlighter ? _highlightColor : _penColor);
    for (var notifier in notifiers) {
      notifier.setStrokeWidth(width);
    }
  }

  void selectEraser() {
    for (var notifier in notifiers) {
      notifier.setEraser();
      notifier.setStrokeWidth(eraserStroke);
    }
    _nowPenType = PenType.eraser;
  }

  void deletePassagePaint(String? id) {
    passageNotifiers[id]?.clear();
  }

  void deleteProblemPaint(String? id) {
    problemNotifiers[id]?.clear();
  }

  void presetScribble(ScribbleNotifier notifier, int index, String id,
      Function(int historyCount) onPointerUp) {
    notifier.setColor(
        _nowPenType == PenType.highlighter ? _highlightColor : _penColor);

    if (_nowPenType == PenType.eraser) {
      notifier.setEraser();
      notifier.setStrokeWidth(eraserStroke);
    } else {
      notifier.setStrokeWidth(_nowStroke.toWidth());
    }

    if (!historyByPage.containsKey(index)) {
      historyByPage[index] = SizedStack(historySize);
    }

    notifier.setOnPointerUpListener(() {
      historyByPage[index]!.add(id);
      onPointerUp.call(historyByPage[index]!.size);
    });
  }

  void reset() {
    passageNotifiers.clear();
    problemNotifiers.clear();
  }

  void undo(int index, Iterable<String> contentIds) {
    final scribbleId = historyByPage[index]!.pop();

    if (scribbleId == "all") {
      for (final id in contentIds) {
        _undoScribble(id);
      }
    } else {
      _undoScribble(scribbleId);
    }
  }

  void _undoScribble(String? id) {
    if (passageNotifiers.containsKey(id)) {
      passageNotifiers[id]!.undo();
    } else if (problemNotifiers.containsKey(id)) {
      problemNotifiers[id]!.undo();
    }
  }

  void notifyAll() {
    passageNotifiers.forEach((key, value) {
      value.update();
    });
    problemNotifiers.forEach((key, value) {
      value.update();
    });
  }

  void addHistory(int index, String s) {
    historyByPage[index]!.add(s);
  }
}

enum Stroke {
  strokeBold,
  strokeNormal,
  strokeThin,
  highlight;

  double toWidth() {
    switch (this) {
      case Stroke.strokeBold:
        return boldStroke;
      case Stroke.strokeNormal:
        return normalStroke;
      case Stroke.strokeThin:
        return thinStroke;
      case Stroke.highlight:
        return highlightStroke;
    }
  }

  PenType toPenType() {
    switch (this) {
      case Stroke.strokeBold:
      case Stroke.strokeNormal:
      case Stroke.strokeThin:
        return PenType.pen;
      case Stroke.highlight:
        return PenType.highlighter;
    }
  }
}

enum PenType {
  none,
  pen,
  highlighter,
  eraser;
}
