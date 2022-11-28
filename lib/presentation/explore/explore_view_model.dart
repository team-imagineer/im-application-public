import 'package:flutter/material.dart';
import 'package:im_application/domain/model/book.dart';
import 'package:im_application/presentation/explore/explore_state.dart';
import 'package:im_application/presentation/my_book/my_book_detail_screen.dart';

import '../../domain/model/filter/filter_row.dart';
import '../../domain/usecase/explore_use_case.dart';
import '../common/error_snack_bar.dart';
import '../common/util/filter_controller.dart';

class ExploreViewModel extends FilterController with ChangeNotifier {
  bool isInitialized = false;
  final ScrollController scrollController = ScrollController();
  final ExploreUseCase useCase;

  ExploreViewModel(this.useCase, List<FilterRow> filterData)
      : super(filterData);

  ExploreState _state = ExploreState(
    books: [],
    page: 1,
    isLoadFinished: false,
  );

  ExploreState get state => _state;

  Future<void> fetch(BuildContext context) async {
    final result = await useCase.getBooks(getFilterData(), 1);

    result.when(
      success: (data) {
        _state = _state.copyWith(
          books: data,
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
  }

  Future<void> addData() async {
    final result = await useCase.getBooks(getFilterData(), _state.page);

    result.when(
      success: (data) {
        final List<Book> newBooks = List.from(_state.books);
        newBooks.addAll(data);
        _state = _state.copyWith(
          books: newBooks,
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

  void chooseBook(Book book, BuildContext context) async {
    final result = await useCase.addBook(book);

    result.when(success: (_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyBookDetailScreen(book)),
      );
    }, error: (error) {
      ErrorSnackBar(
        error: error,
        context: context,
      ).show(context);
    });
  }

  @override
  void deleteAllFilters(BuildContext context) {
    clearFilters();
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
}
