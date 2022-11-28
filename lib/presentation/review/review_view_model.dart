import 'package:flutter/material.dart';
import 'package:im_application/domain/model/problem_review_data.dart';
import 'package:im_application/domain/usecase/bookmark_use_case.dart';
import 'package:im_application/domain/usecase/review_use_case.dart';
import 'package:im_application/presentation/review/review_detail_screen.dart';
import 'package:im_application/presentation/review/review_state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../domain/model/filter/filter_row.dart';
import '../../domain/model/learning.dart';
import '../common/error_snack_bar.dart';
import '../common/search_bar.dart';
import '../common/seodaang_dialog.dart';
import '../common/util/filter_controller.dart';
import '../my_book/my_book_detail_screen.dart';
import '../solve/solve_screen.dart';
import '../solve/solve_state.dart';

class ReviewViewModel extends FilterController with ChangeNotifier {
  final ReviewUseCase useCase;
  final BookmarkUseCase bookmarkUseCase;
  final ScrollController scrollController = ScrollController();
  bool isInitialized = false;
  DateRangePickerController dateController = DateRangePickerController();

  ReviewState _state = ReviewState(
    problems: {},
    isSelected: {},
    page: 1,
    isLoadFinished: false,
  );

  ReviewState get state => _state;

  ReviewViewModel(
      this.useCase, this.bookmarkUseCase, List<FilterRow> filterData)
      : super(filterData);

  void init(BuildContext context) {
    if (!isInitialized) {
      isInitialized = true;
      dateController.addPropertyChangedListener((type) {
        if (type == "selectedRange") {
          fetch(context);
          notifyListeners();
        }
      });
    }
  }

  Future<void> fetch(BuildContext context) async {
    final result = await useCase.getProblems(
        getFilterData(), dateController.selectedRange, 1);

    result.when(
      success: (data) {
        final problemsMap = _makeProblemsMap(data);
        _state = _state.copyWith(
          problems: problemsMap,
          page: 2,
          isLoadFinished: data.isEmpty,
        );
        notifyListeners();
      },
      error: (error) {
        ErrorSnackBar(
          error: error,
          context: context,
        ).show(context);
      },
    );

    if (scrollController.hasClients) {
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }

    notifyListeners();
  }

  Future<void> addData() async {
    final result = await useCase.getProblems(
        getFilterData(), dateController.selectedRange, _state.page);

    result.when(
      success: (data) {
        final Map<String, List<ProblemReviewData>> newProblems =
            Map.from(_state.problems);
        _addProblemsToMap(newProblems, data);
        _state = _state.copyWith(
          problems: newProblems,
          page: _state.page + 1,
          isLoadFinished: data.isEmpty,
        );
        notifyListeners();
      },
      error: (error) {},
    );
  }

  void chooseProblem(String problemId) {
    final newMap = Map.of(_state.isSelected);

    if (newMap.containsKey(problemId)) {
      newMap[problemId] = !newMap[problemId]!;
    } else {
      newMap[problemId] = true;
    }

    _state = _state.copyWith(isSelected: newMap);
    notifyListeners();
  }

  bool hasChecked() {
    return List.from(_state.isSelected.values)
        .fold(false, (previous, element) => previous | element);
  }

  List<String> getAllId() {
    List<String> result = [];

    for (final problems in _state.problems.values) {
      result.addAll(problems.map((e) => e.problemData.id));
    }
    return result;
  }

  int getProblemCount() {
    return _state.problems.values
        .fold(0, (previousValue, element) => previousValue + element.length);
  }

  void makeWorkbook(BuildContext parentContext, List<String> ids) async {
    final count = ids.length;

    final controller = TextEditingController();
    showDialog(
      context: parentContext,
      barrierDismissible: false,
      builder: (context) => SeodaangDialog(
        title: "워크북 생성",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SeodaangDialogText("$count개의 문제로 워크북을 생성합니다."),
            const SizedBox(height: 5),
            SearchBar(
              placeHolder: "워크북 제목",
              controller: controller,
              showIcon: false,
              maxLine: 1,
            ),
            const SizedBox(height: 5),
          ],
        ),
        positiveText: "생성하기",
        negativeText: "취소하기",
        onPositiveClicked: () async {
          if (controller.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("워크북 제목을 입력해주세요."),
              ),
            );
          } else {
            _makeWorkbook(parentContext, controller.text, ids);
          }
        },
        onNegativeClicked: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void study(BuildContext context, List<String> ids) async {
    final result = await useCase.startReview(ids);

    result.when(success: (content) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SolveScreen(
            content: content,
            learning: Learning(
              id: content.id,
              status: Status.onGoing,
              score: null,
              elapsed: null,
            ),
            solveMode: SolveMode.solve,
          ),
        ),
      );
      deselectAll();
    }, error: (e) {
      ErrorSnackBar(
        error: e,
        context: context,
      ).show(context);
    });
  }

  List<String> getCheckedId() {
    List<String> ids = List.from(_state.isSelected.keys);
    final result =
        List<String>.from(ids.where((element) => _state.isSelected[element]!));

    if (result.isNotEmpty) {
      return result;
    }

    List<String> allIds = [];

    for (final problems in _state.problems.values) {
      allIds.addAll(problems.map((e) => e.problemData.id));
    }

    return allIds;
  }

  void _makeWorkbook(
      BuildContext context, String name, List<String> ids) async {
    final result = await useCase.makeWorkbook(ids, name);

    result.when(success: (book) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("워크북이 추가되었습니다."),
          action: SnackBarAction(
            label: "바로 풀기",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyBookDetailScreen(book)),
              );
            },
          ),
        ),
      );
      Navigator.of(context).pop();
      deselectAll();
    }, error: (e) {
      ErrorSnackBar(
        error: e,
        context: context,
      ).show(context);
      Navigator.of(context).pop();
    });
  }

  @override
  void deleteAllFilters(BuildContext context) {
    clearFilters();
    dateController.selectedRange = null;
    fetch(context);
    notifyListeners();
  }

  @override
  void onFilterClicked(String rowId, String itemId, BuildContext context) {
    reverseFilterStatus(rowId, itemId);
    fetch(context);
    notifyListeners();
  }

  Future<void> nextPage() async {
    // 일부러 느리게 하여 무지성 스크롤 예방
    await Future.delayed(const Duration(milliseconds: 500));
    await addData();
  }

  void deselectAll() {
    _state = _state.copyWith(isSelected: {});
    notifyListeners();
  }

  void viewDetails(ProblemReviewData problemData, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ReviewDetailScreen(problemReviewData: problemData),
      ),
    );
  }

  bool hasData() {
    return _state.problems.isNotEmpty;
  }

  Map<String, List<ProblemReviewData>> _makeProblemsMap(
      List<ProblemReviewData> data) {
    Map<String, List<ProblemReviewData>> result = {};
    _addProblemsToMap(result, data);
    return result;
  }

  void _addProblemsToMap(
      Map<String, List<ProblemReviewData>> map, List<ProblemReviewData> data) {
    for (final element in data) {
      final key = _getYearMonthDay(element.histories.last.solvedTime);
      if (map.containsKey(key)) {
        map[_getYearMonthDay(element.histories.last.solvedTime)]!.add(element);
      } else {
        map[_getYearMonthDay(element.histories.last.solvedTime)] = [element];
      }
    }
  }

  String _getYearMonthDay(DateTime dateTime) {
    return "${dateTime.year}.${dateTime.month}.${dateTime.day}";
  }
}
