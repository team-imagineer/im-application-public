import 'package:flutter/material.dart';
import 'package:im_application/presentation/main/main_view_model.dart';
import 'package:im_application/presentation/my_book/my_book_view_model.dart';
import 'package:im_application/ui/service_colors.dart';
import 'package:provider/provider.dart';

import '../common/book_grid.dart';
import '../common/empty_result.dart';

class MyBookScreen extends StatelessWidget {
  const MyBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyBookViewModel>();
    viewModel.init(context);

    final isWorkbook = viewModel.state.nowPageIndex == 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PageHeader(viewModel: viewModel),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: viewModel.books.isNotEmpty
                ? BookGrid(
                    controller: viewModel.scrollController,
                    books: viewModel.books,
                    onTaps: List.generate(
                        viewModel.books.length,
                        (index) => () {
                              viewModel.chooseBook(
                                  viewModel.books[index], context);
                            }),
                    isMyBook: true,
                  )
                : viewModel.state.loadFinished
                    ? EmptyResult(
                        title: "아직 ${isWorkbook ? "워크북" : "문제집"}이 없습니다",
                        buttonText: "${isWorkbook ? "워크북" : "문제집"} 추가하러 가기",
                        onTap: () {
                          context
                              .read<MainViewModel>()
                              .setSubPageIndex(context, 0, isWorkbook ? 1 : 0);
                        },
                      )
                    : const SizedBox(),
          ),
        ),
      ],
    );
  }

  void fetch(BuildContext context) {
    context.read<MyBookViewModel>().fetch(context);
  }
}

class _PageHeader extends StatelessWidget {
  final MyBookViewModel viewModel;

  const _PageHeader({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: List.generate(
        viewModel.pageNames.length,
        (index) => GestureDetector(
          child: AnimatedContainer(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              border: Border(
                  bottom: viewModel.state.nowPageIndex == index
                      ? BorderSide(
                          color: Theme.of(context)
                              .extension<ServiceColors>()!
                              .textBlack!,
                          width: 3,
                        )
                      : BorderSide.none),
            ),
            child: AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize: 17,
                color: viewModel.state.nowPageIndex == index
                    ? Theme.of(context).extension<ServiceColors>()!.textBlack
                    : Theme.of(context)
                        .extension<ServiceColors>()!
                        .disableTextGrey,
                fontWeight: viewModel.state.nowPageIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
              duration: const Duration(milliseconds: 100),
              child: Text(viewModel.pageNames[index]),
            ),
          ),
          onTap: () {
            viewModel.changePage(index);
          },
        ),
      ),
    );
  }
}
