import 'package:flutter/material.dart';
import 'package:im_application/domain/usecase/my_book_use_case.dart';
import 'package:im_application/presentation/my_book/my_book_detail_screen.dart';

import '../../domain/model/book.dart';
import '../common/error_snack_bar.dart';
import 'my_book_state.dart';

class MyBookViewModel extends ChangeNotifier {
  bool isInitialized = false;
  final ScrollController scrollController = ScrollController();
  final MyBookUseCase useCase;

  final pageNames = [
    "문제집",
    "워크북",
  ];

  MyBookViewModel(this.useCase);

  MyBookState _state = MyBookState(
    books: [],
    workbooks: [],
    sortBy: Sort.recentlyOpen,
    nowPageIndex: 0,
  );

  MyBookState get state => _state;

  List<Book> get books =>
      _state.nowPageIndex == 0 ? _state.books : state.workbooks;

  void init(BuildContext context) {
    if (!isInitialized) {
      isInitialized = true;
      fetch(context);
    }
  }

  Future<void> sortBook(Sort sortBy, BuildContext context) async {
    _state = _state.copyWith(sortBy: sortBy);
    fetch(context);
  }

  Future<void> fetch(BuildContext context) async {
    final bookResult = await useCase.getMyBooks(_state.sortBy);
    final workbookResult = await useCase.getMyWorkbooks(_state.sortBy);

    bookResult.when(
      success: (data) {
        _state = _state.copyWith(books: data, loadFinished: true);
        notifyListeners();
      },
      error: (error) {
        _state = _state.copyWith(loadFinished: true);
        ErrorSnackBar(
          error: error,
          context: context,
        ).show(context);
      },
    );

    workbookResult.when(
      success: (data) {
        _state = _state.copyWith(workbooks: data, loadFinished: true);
        notifyListeners();
      },
      error: (error) {
        _state = _state.copyWith(loadFinished: true);
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

  void chooseBook(Book book, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyBookDetailScreen(book)),
    );
  }

  void changePage(int index) {
    if (index != _state.nowPageIndex) {
      _state = _state.copyWith(nowPageIndex: index);
      notifyListeners();
    }
  }
}
