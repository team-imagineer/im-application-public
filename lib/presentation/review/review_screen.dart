import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:im_application/presentation/common/filter_sheet.dart';
import 'package:im_application/presentation/review/review_view_model.dart';
import 'package:im_application/ui/service_assets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../domain/model/problem_review_data.dart';
import '../../ui/service_colors.dart';
import '../common/empty_result.dart';
import '../common/filter_list.dart';
import '../common/large_check_box_with_number.dart';
import '../common/ox_tile.dart';
import '../common/problem_tile.dart';
import '../common/seodaang_title.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ReviewViewModel>();
    viewModel.init(context);

    final width = MediaQuery.of(context).size.width - 80 - 10;
    final isSmall = width < 600;
    final padding = isSmall ? 20.0 : 30.0;

    final keys = List.from(viewModel.state.problems.keys);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (viewModel.hasData())
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      viewModel.study(context, viewModel.getAllId());
                    },
                    child: Container(
                      width: width * 0.5,
                      height: isSmall ? 130 : 110,
                      padding: EdgeInsets.fromLTRB(padding, 20, padding, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: Theme.of(context)
                                .extension<ServiceColors>()!
                                .borderGrey!),
                        color:
                            Theme.of(context).extension<ServiceColors>()!.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.center,
                            direction: Axis.vertical,
                            spacing: 3,
                            children: [
                              if (isSmall)
                                SvgPicture.asset(
                                  ServiceAssets.reviewCheckIcon,
                                  height: 20,
                                ),
                              Text(
                                "${viewModel.getProblemCount()}개의 문제",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .extension<ServiceColors>()!
                                      .textBlack,
                                ),
                              ),
                              Text(
                                "다시 한 번 풀어보기",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .extension<ServiceColors>()!
                                      .textBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          if (!isSmall)
                            SvgPicture.asset(
                              ServiceAssets.reviewCheckIcon,
                              width: 60,
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      viewModel.makeWorkbook(context, viewModel.getAllId());
                    },
                    child: Container(
                      width: width * 0.5,
                      height: isSmall ? 130 : 110,
                      padding: EdgeInsets.fromLTRB(padding, 20, padding, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: Theme.of(context)
                                .extension<ServiceColors>()!
                                .borderGrey!),
                        color:
                            Theme.of(context).extension<ServiceColors>()!.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.center,
                            direction: Axis.vertical,
                            spacing: 3,
                            children: [
                              if (isSmall)
                                SvgPicture.asset(
                                  ServiceAssets.reviewWorkbookIcon,
                                  height: 30,
                                ),
                              Text(
                                "${viewModel.getProblemCount()}개의 문제로",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .extension<ServiceColors>()!
                                      .textBlack,
                                ),
                              ),
                              Text(
                                "나만의 워크북 만들기",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .extension<ServiceColors>()!
                                      .textBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          if (!isSmall)
                            SvgPicture.asset(
                              ServiceAssets.reviewWorkbookIcon,
                              width: 87,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            if (viewModel.hasData()) const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SeodaangTitle("학습 이력", isMini: true),
                GestureDetector(
                  child: SvgPicture.asset(
                    ServiceAssets.filterButton,
                    height: 30,
                  ),
                  onTap: () {
                    showMaterialModalBottomSheet(
                      expand: true,
                      context: context,
                      builder: (context) {
                        final sheetViewModel = context.watch<ReviewViewModel>();
                        return FilterSheet(
                          filterController: sheetViewModel,
                          upperWidget: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 100,
                                child: Text(
                                  "풀이 날짜",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .extension<ServiceColors>()!
                                        .textBlack,
                                  ),
                                ),
                              ),
                              _FilterCalender(viewModel: sheetViewModel),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            FilterList(filterController: viewModel),
            Expanded(
              child: viewModel.state.problems.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                        controller: viewModel.scrollController,
                        itemBuilder: (context, index) {
                          if (index < keys.length) {
                            final e = keys[index];
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .extension<ServiceColors>()!
                                        .secondaryTextGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                _ProblemGrid(
                                  problems: viewModel.state.problems[e]!,
                                  isChecked: List.from(
                                    viewModel.state.problems[e]!.map((e1) =>
                                        viewModel.state
                                            .isSelected[e1.problemData.id] ==
                                        true),
                                  ),
                                  onTaps: List.from(
                                    viewModel.state.problems[e]!.map(
                                      (e1) => () {
                                        viewModel
                                            .chooseProblem(e1.problemData.id);
                                      },
                                    ),
                                  ),
                                  onMoreButtonTaps: List.from(
                                    viewModel.state.problems[e]!.map(
                                      (e1) => () {
                                        viewModel.viewDetails(e1, context);
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            );
                          } else {
                            if (!viewModel.state.isLoadFinished) {
                              viewModel.nextPage();
                            }
                            return const SizedBox();
                          }
                        },
                        itemCount: keys.length + 1,
                      ),
                    )
                  : EmptyResult(
                      title: "학습 이력이 없습니다.",
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
                          viewModel.study(context, viewModel.getCheckedId());
                        },
                      ),
                      LargeCheckBoxMenuItem(
                        "워크북 만들기",
                        Theme.of(context).extension<ServiceColors>()!.primary!,
                        () {
                          viewModel.makeWorkbook(
                              context, viewModel.getCheckedId());
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

  void fetch(BuildContext context) {
    context.read<ReviewViewModel>().fetch(context);
  }
}

class _ProblemGrid extends StatelessWidget {
  final List<ProblemReviewData> problems;
  final List<Function()> onTaps;
  final List<bool> isChecked;
  final List<Function()> onMoreButtonTaps;

  const _ProblemGrid({
    Key? key,
    required this.problems,
    required this.onTaps,
    required this.isChecked,
    required this.onMoreButtonTaps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = problems.length;

    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 20.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width ~/ 300,
        childAspectRatio: 1.7,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: count,
      itemBuilder: (context, index) => GestureDetector(
        onTap: onTaps[index],
        child: _ProblemTile(
          problemData: problems[index],
          isChecked: isChecked[index],
          onMoreButtonTap: onMoreButtonTaps[index],
        ),
      ),
    );
  }
}

class _ProblemTile extends StatelessWidget {
  final ProblemReviewData problemData;
  final bool isChecked;
  final Function() onMoreButtonTap;

  const _ProblemTile(
      {Key? key,
      required this.problemData,
      required this.isChecked,
      required this.onMoreButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final corrections = problemData.corrections;
    final length = min(3, corrections.length);

    return ProblemTile(
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              length,
              (index) => OXTile(
                isO: corrections[corrections.length - length + index],
                padding: const EdgeInsets.only(right: 5),
              ),
            ),
          ),
          GestureDetector(
            onTap: onMoreButtonTap,
            child: Icon(
              Icons.more_horiz,
              color: Theme.of(context)
                  .extension<ServiceColors>()!
                  .secondaryTextGrey!,
            ),
          ),
        ],
      ),
      problemData: problemData.problemData,
      isChecked: isChecked,
    );
  }
}

class _FilterCalender extends StatelessWidget {
  final ReviewViewModel viewModel;

  const _FilterCalender({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: SfDateRangePicker(
        controller: viewModel.dateController,
        selectionMode: DateRangePickerSelectionMode.range,
        todayHighlightColor:
            Theme.of(context).extension<ServiceColors>()!.textOrangeLight,
        selectionColor:
            Theme.of(context).extension<ServiceColors>()!.textOrangeLight,
        rangeSelectionColor:
            Theme.of(context).extension<ServiceColors>()!.primaryLight,
        startRangeSelectionColor:
            Theme.of(context).extension<ServiceColors>()!.primary,
        endRangeSelectionColor:
            Theme.of(context).extension<ServiceColors>()!.primary,
        selectionTextStyle: TextStyle(
          color: Theme.of(context).extension<ServiceColors>()!.black,
          fontWeight: FontWeight.w600,
        ),
        rangeTextStyle: TextStyle(
          color: Theme.of(context).extension<ServiceColors>()!.textBlack,
          fontWeight: FontWeight.w500,
        ),
        monthCellStyle: DateRangePickerMonthCellStyle(
          todayTextStyle: TextStyle(
            color:
                Theme.of(context).extension<ServiceColors>()!.textOrangeLight,
          ),
        ),
        yearCellStyle: DateRangePickerYearCellStyle(
          todayTextStyle: TextStyle(
            color:
                Theme.of(context).extension<ServiceColors>()!.textOrangeLight,
          ),
        ),
        minDate: DateTime.now().subtract(const Duration(days: 365)),
        maxDate: DateTime.now(),
      ),
    );
  }
}
