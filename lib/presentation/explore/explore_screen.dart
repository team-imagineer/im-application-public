import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_application/presentation/common/empty_result.dart';
import 'package:im_application/presentation/common/filter_sheet.dart';
import 'package:im_application/presentation/explore/explore_view_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../ui/service_assets.dart';
import '../common/book_grid.dart';
import '../common/filter_list.dart';
import '../common/seodaang_title.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExploreViewModel>();
    viewModel.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SeodaangTitle("나와 비슷한 학생들이\n많이 풀어본 문제집을 추천드려요.",
                isMini: true),
            GestureDetector(
              child: SvgPicture.asset(
                ServiceAssets.filterButton,
                height: 30,
              ),
              onTap: () {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) {
                    final sheetViewModel = context.watch<ExploreViewModel>();
                    return FilterSheet(filterController: sheetViewModel);
                  },
                );
              },
            ),
          ],
        ),
        FilterList(filterController: viewModel),
        //const SizedBox(height: 5),
        //SearchBar(placeHolder: "문제집을 검색해보세요."),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: viewModel.state.books.isNotEmpty
                ? BookGrid(
              controller: viewModel.scrollController,
                    books: viewModel.state.books,
                    onTaps: List.generate(
                        viewModel.state.books.length,
                        (i) => () {
                              viewModel.chooseBook(
                                  viewModel.state.books[i], context);
                            }),
                    isMyBook: false,
                    onScrollEnd: viewModel.state.isLoadFinished
                        ? null
                        : () async {
                await viewModel.nextPage();
              },
                  )
                : EmptyResult(
                    title: "문제집을 찾을 수 없습니다.",
                    buttonText: "필터 초기화하기",
                    onTap: () {
                      viewModel.deleteAllFilters(context);
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
