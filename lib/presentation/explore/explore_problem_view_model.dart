import 'package:flutter/material.dart';

import '../../domain/model/filter/filter_row.dart';
import '../../domain/model/learning.dart';
import '../../domain/model/problem_data.dart';
import '../../domain/usecase/explore_use_case.dart';
import '../../domain/usecase/review_use_case.dart';
import '../common/error_snack_bar.dart';
import '../common/search_bar.dart';
import '../common/seodaang_dialog.dart';
import '../common/util/filter_controller.dart';
import '../my_book/my_book_detail_screen.dart';
import '../solve/solve_screen.dart';
import '../solve/solve_state.dart';
import 'explore_problem_state.dart';

class ExploreProblemViewModel extends FilterController with ChangeNotifier {
  bool isInitialized = false;
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  final ExploreUseCase useCase;
  final ReviewUseCase reviewUseCase;

  ExploreProblemViewModel(
      this.useCase, this.reviewUseCase, List<FilterRow> filterData)
      : super(filterData);

  ExploreProblemState _state = ExploreProblemState(
    problems: [],
    isSelected: {},
    page: 1,
    isLoadFinished: false,
    query: "",
    isLoading: false,
  );

  ExploreProblemState get state => _state;

  Future<void> fetch(BuildContext context) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    textController.text = _state.query;
    final result = await useCase.getProblems(getFilterData(), _state.query, 1);

    result.when(
      success: (data) {
        _state = _state.copyWith(
          problems: data,
          page: 2,
          isLoadFinished: data.isEmpty,
          isLoading: false,
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
  }

  Future<void> addData() async {
    final result = await useCase.getProblems(
      getFilterData(),
      _state.query,
      _state.page,
    );

    result.when(
      success: (data) {
        final List<ProblemData> newProblems = List.from(_state.problems);
        newProblems.addAll(data);
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

  void init(BuildContext context) {
    if (!isInitialized) {
      isInitialized = true;
      clearFilters();
      fetch(context);
    }
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

  void makeWorkbook(BuildContext parentContext) async {
    final controller = TextEditingController();

    showDialog(
      context: parentContext,
      barrierDismissible: false,
      builder: (context) => SeodaangDialog(
        title: "워크북 생성",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SeodaangDialogText("${getCheckedId().length}개의 문제로 워크북을 생성합니다."),
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
            _makeWorkbook(parentContext, controller.text);
          }
        },
        onNegativeClicked: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  List<String> getCheckedId() {
    List<String> ids = List.from(_state.isSelected.keys);
    return List.from(ids.where((element) => _state.isSelected[element]!));
  }

  void _makeWorkbook(BuildContext context, String name) async {
    final result = await reviewUseCase.makeWorkbook(getCheckedId(), name);

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

  void search(String value, BuildContext context) {
    _state = _state.copyWith(query: value);
    fetch(context);
  }

  void study(BuildContext context) async {
    final result = await reviewUseCase.startReview(getCheckedId());

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

  @override
  void deleteAllFilters(BuildContext context) {
    clearFilters();
    _state = _state.copyWith(query: "");
    fetch(context);
  }

  @override
  void onFilterClicked(String rowId, String itemId, BuildContext context) {
    reverseFilterStatus(rowId, itemId);
    fetch(context);
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
}
