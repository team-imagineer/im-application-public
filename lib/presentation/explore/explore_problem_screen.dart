import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import 'package:im_application/presentation/explore/explore_problem_view_model.dart';
import "package:modal_bottom_sheet/modal_bottom_sheet.dart";
import 'package:provider/provider.dart';

import "../../ui/service_assets.dart";
import "../../ui/service_colors.dart";
import '../common/empty_result.dart';
import '../common/filter_list.dart';
import "../common/filter_sheet.dart";
import "../common/large_check_box_with_number.dart";
import '../common/problem_grid.dart';
import '../common/search_bar.dart';
import '../common/seodaang_title.dart';

class ExploreProblemScreen extends StatelessWidget {
  const ExploreProblemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExploreProblemViewModel>();
    viewModel.init(context);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SeodaangTitle("원하는 문제만 골라\n나만의 워크북을 만들어보세요.",
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
                        final sheetViewModel =
                            context.watch<ExploreProblemViewModel>();
                        return FilterSheet(filterController: sheetViewModel);
                      },
                    );
                  },
                ),
              ],
            ),
            FilterList(filterController: viewModel),
            const SizedBox(height: 20),
            SearchBar(
              placeHolder: "작품명이나 키워드를 검색해보세요.",
              controller: viewModel.textController,
              onSubmit: (value) {
                viewModel.search(value, context);
              },
            ),
            Expanded(
              child: viewModel.state.isLoading
                  ? const _LoadingWidget()
                  : viewModel.state.problems.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: ProblemGrid(
                            controller: viewModel.scrollController,
                            problems: viewModel.state.problems,
                            onTaps: List.from(
                              viewModel.state.problems.map(
                                (e) => () {
                                  viewModel.chooseProblem(e.id);
                                },
                              ),
                            ),
                            isChecked: List.from(
                              viewModel.state.problems.map((e) =>
                                  viewModel.state.isSelected[e.id] == true),
                            ),
                            onScrollEnd: viewModel.state.isLoadFinished
                                ? null
                                : () async {
                                    await viewModel.nextPage();
                                  },
                          ),
                        )
                      : EmptyResult(
                          title: "문제를 찾을 수 없습니다.",
                          buttonText: "필터 초기화하기",
                          onTap: () {
                            viewModel.deleteAllFilters(context);
                          },
                        ),
            ),
          ],
        ),
        Positioned(
          bottom: 20.0,
          right: 0,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: Tween<double>(begin: 0.2, end: 1).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0, 0.4), end: const Offset(0, 0))
                    .animate(animation),
                child: child,
              ),
            ),
            child: (viewModel.state.isSelected.containsValue(true))
                ? LargeCheckBoxWithNumber(
              number: viewModel.getCheckedId().length,
                    menuItems: [
                      LargeCheckBoxMenuItem(
                        "선택 취소",
                        Theme.of(context)
                            .extension<ServiceColors>()!
                            .buttonGrey!,
                        () {
                          viewModel.deselectAll();
                        },
                      ),
                      LargeCheckBoxMenuItem(
                        "학습하기",
                        Theme.of(context).extension<ServiceColors>()!.primary!,
                        () {
                          viewModel.study(context);
                        },
                      ),
                      LargeCheckBoxMenuItem(
                        "워크북 만들기",
                        Theme.of(context).extension<ServiceColors>()!.primary!,
                        () {
                          viewModel.makeWorkbook(context);
                        },
                      ),
                    ],
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          color: Theme.of(context).extension<ServiceColors>()!.primary,
        ),
      ),
    );
  }
}
