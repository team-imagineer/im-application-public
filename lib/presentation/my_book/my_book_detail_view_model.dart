import 'package:flutter/material.dart';
import 'package:im_application/presentation/my_book/my_book_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/source/model/result.dart';
import '../../domain/model/book.dart';
import '../../domain/model/learning.dart';
import '../../domain/usecase/my_book_use_case.dart';
import '../common/error_snack_bar.dart';
import '../common/seodaang_dialog.dart';
import '../solve/solve_screen.dart';
import '../solve/solve_state.dart';
import 'my_book_detail_state.dart';

class MyBookDetailViewModel extends ChangeNotifier {
  bool isInitialized = false;
  Book? book;
  final MyBookUseCase useCase;

  MyBookDetailViewModel(this.useCase);

  MyBookDetailState _state = MyBookDetailState(
    learnings: [],
    isEditMode: false,
    isSelected: {},
  );

  MyBookDetailState get state => _state;

  void init(BuildContext context, Book book) {
    if (!isInitialized) {
      isInitialized = true;
      this.book = book;
      fetch(context);
    }
  }

  void fetch(BuildContext context) async {
    final learningResult = await useCase.getLearnings(book!);
    learningResult.when(success: (learnings) {
      _state = _state.copyWith(learnings: learnings);
      notifyListeners();
    }, error: (error) {
      ErrorSnackBar(
        error: error,
        context: context,
      ).show(context);
    });
  }

  void close() {
    _state = MyBookDetailState(
      learnings: [],
      isEditMode: false,
      isSelected: {},
    );
    isInitialized = false;
  }

  List<String> getCheckedId() {
    List<String> ids = List.from(_state.isSelected.keys);
    return List.from(ids.where((element) => _state.isSelected[element]!));
  }

  void makeNewLearning(BuildContext context) async {
    final result = await useCase.makeNewLearning(book!);
    result.when(success: (learning) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SolveScreen(
            book: book!,
            learning: learning,
            solveMode: SolveMode.solve,
          ),
        ),
      );
      close();
    }, error: (error) {
      ErrorSnackBar(
        error: error,
        context: context,
      ).show(context);
    });
  }

  void deleteLearnings(List<String> learningIds, BuildContext context) async {
    final count = learningIds.length;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context1) => SeodaangDialog.withText(
        title: "?????? ?????? ????????????",
        text: "????????? ???????????? ????????? ?????? ???????????? ???????????????.\n????????? $count?????? ????????? ?????????????????????????",
        onPositiveClicked: () async {
          Navigator.of(context1).pop();

          final methods =
              learningIds.map((e) => useCase.deleteMyLearning(book!, e));
          final results = await Future.wait(methods);
          ApiError? error;

          for (final result in results) {
            result.when(
                success: (_) {},
                error: (e) {
                  error = e;
                });
          }

          if (error == null) {
            changeEditMode();
            fetch(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("?????? ????????? ?????????????????????."),
              ),
            );
          } else {
            ErrorSnackBar(
              error: error!,
              context: context,
            ).show(context);
          }
        },
        onNegativeClicked: () {
          Navigator.of(context).pop();
        },
        positiveText: "????????????",
        negativeText: "????????????",
      ),
    );
  }

  void deleteBook(Book book, BuildContext context) async {
    final isWorkbook = book.type == BookType.workbook;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SeodaangDialog.withText(
        title: "'${book.title}' ????????????",
        text:
            "${isWorkbook ? "?????????" : "?????????"} ????????? ?????? ?????? ????????? ?????? ???????????????.\n????????? ?????????????????????????",
        onPositiveClicked: () async {
          for (final learning in state.learnings) {
            await useCase.deleteMyLearning(book, learning.id);
          }

          final result = isWorkbook
              ? await useCase.deleteMyWorkbook(book)
              : await useCase.deleteMyBook(book);
          result.when(success: (_) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            close();
            context.read<MyBookViewModel>().fetch(context);
          }, error: (error) {
            ErrorSnackBar(
              error: error,
              context: context,
            ).show(context);
          });
        },
        onNegativeClicked: () {
          Navigator.of(context).pop();
        },
        positiveText: "????????????",
        negativeText: "????????????",
      ),
    );
  }

  void continueLearning(Learning learning, BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SolveScreen(
          book: book!,
          learning: learning,
          solveMode: SolveMode.solve,
        ),
      ),
    );
    close();
  }

  void reviewLearning(Learning learning, BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SolveScreen(
          book: book!,
          learning: learning,
          solveMode: SolveMode.result,
        ),
      ),
    );
    close();
  }

  void changeEditMode() {
    _state = _state.copyWith(isEditMode: !_state.isEditMode, isSelected: {});
    notifyListeners();
  }

  void selectItem(String learningId) {
    final newMap = Map.of(_state.isSelected);

    if (newMap.containsKey(learningId)) {
      newMap[learningId] = !newMap[learningId]!;
    } else {
      newMap[learningId] = true;
    }

    _state = _state.copyWith(isSelected: newMap);
    notifyListeners();
  }
}
