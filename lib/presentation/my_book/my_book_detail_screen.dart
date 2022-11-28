import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import 'package:provider/provider.dart';

import '../../domain/model/book.dart';
import "../../domain/model/learning.dart";
import "../../ui/service_assets.dart";
import '../../ui/service_colors.dart';
import "../common/check_box.dart";
import "../common/info_circle.dart";
import "../common/large_check_box_with_number.dart";
import '../common/page_header_navigator.dart';
import 'my_book_detail_view_model.dart';

class MyBookDetailScreen extends StatelessWidget {
  final Book book;

  const MyBookDetailScreen(this.book, {Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context, MyBookDetailViewModel viewModel) {
    final learningCount = viewModel.state.learnings.length;
    final maxScore = viewModel.state.learnings
        .fold(0, (int value, element) => max<int>(value, element.score ?? 0));
    Learning? continueLearning;

    for (final learning in viewModel.state.learnings) {
      if (learning.status != Status.complete) {
        continueLearning = learning;
      }
    }

    return Stack(
      children: [
        ListView(
          children: [
            const SizedBox(height: 200),
            Container(
              color:
                  Theme.of(context).extension<ServiceColors>()!.backgroundGrey,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: learningCount + 1,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == learningCount) {
                      return const SizedBox(height: 20);
                    }

                    final target =
                        viewModel.state.learnings[learningCount - index - 1];

                    return _SessionInfoListItem(
                      count: learningCount - index,
                      isCompleted: target.status == Status.complete,
                      isEditMode: viewModel.state.isEditMode,
                      isChecked: viewModel.state.isSelected[target.id] ?? false,
                      solvedProblem: target.score ?? 0,
                      progressTimeInSeconds: target.elapsed ?? 0,
                      onStudyButtonTap: () {
                        viewModel.continueLearning(target, context);
                      },
                      onReviewButtonTap: () {
                        viewModel.reviewLearning(target, context);
                      },
                      onCheckButtonTap: () {
                        viewModel.selectItem(target.id);
                      },
                    );
                  }),
            ),
          ],
        ),
        _BookInfoWithButton(
          subtitle: book.subject ?? "",
          title: book.title,
          count: learningCount,
          canContinue: continueLearning != null,
          maxScore: maxScore,
          isEditMode: viewModel.state.isEditMode,
          onNewButtonTap: () {
            viewModel.makeNewLearning(context);
          },
          onContinueButtonTap: () {
            viewModel.continueLearning(continueLearning!, context);
          },
          onDeleteButtonTap: learningCount == 0
              ? null
              : () {
                  viewModel.deleteBook(book, context);
                },
          onEditButtonTap: learningCount == 0
              ? null
              : () {
                  viewModel.changeEditMode();
                },
        ),
        Positioned(
          bottom: 20.0,
          right: 40.0,
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
            child: (viewModel.state.isEditMode)
                ? LargeCheckBoxWithNumber(
                    number: viewModel.getCheckedId().length,
                    menuItems: [
                      LargeCheckBoxMenuItem(
                        "편집 취소",
                        Theme.of(context)
                            .extension<ServiceColors>()!
                            .buttonGrey!,
                        () {
                          viewModel.changeEditMode();
                        },
                      ),
                      if (viewModel.state.isSelected.containsValue(true))
                        LargeCheckBoxMenuItem(
                          "삭제하기",
                          Theme.of(context)
                              .extension<ServiceColors>()!
                              .wrongRed!,
                          () {
                            viewModel.deleteLearnings(
                                viewModel.getCheckedId(), context);
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

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyBookDetailViewModel>();
    viewModel.init(context, book);

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).extension<ServiceColors>()!.backgroundGrey,
          child: Column(
            children: [
              PageHeaderNavigator(
                title: "문제집 풀어보기",
                onClosed: () {
                  viewModel.close();
                },
              ),
              Flexible(
                child: _buildBody(context, viewModel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookInfoWithButton extends StatelessWidget {
  final String subtitle;
  final String title;
  final int count;
  final int maxScore;
  final bool canContinue;
  final bool isEditMode;
  final Function() onNewButtonTap;
  final Function() onContinueButtonTap;
  final Function()? onDeleteButtonTap;
  final Function()? onEditButtonTap;

  const _BookInfoWithButton({
    Key? key,
    required this.subtitle,
    required this.title,
    required this.count,
    required this.maxScore,
    required this.canContinue,
    required this.isEditMode,
    required this.onNewButtonTap,
    required this.onContinueButtonTap,
    this.onDeleteButtonTap,
    this.onEditButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      decoration: BoxDecoration(
        color: Theme.of(context).extension<ServiceColors>()!.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).extension<ServiceColors>()!.borderGrey!,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                direction: Axis.vertical,
                spacing: 10,
                children: [
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Theme.of(context)
                          .extension<ServiceColors>()!
                          .secondaryTextGrey,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context)
                          .extension<ServiceColors>()!
                          .textBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Wrap(
                  children: [
                    InfoCircle(
                      circleTitle: "최고 점수",
                      circleContent: "$maxScore점",
                      circleColor: Theme.of(context)
                          .extension<ServiceColors>()!
                          .rightBlue!,
                      width: 80,
                      strokeWidth: 4,
                    ),
                    const SizedBox(width: 20),
                    InfoCircle(
                      circleTitle: "풀이 횟수",
                      circleContent: "$count회",
                      circleColor: Theme.of(context)
                          .extension<ServiceColors>()!
                          .buttonOrange!,
                      width: 80,
                      strokeWidth: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (canContinue)
                    _RoundButton(
                      text: "이어 풀기",
                      onTap: onContinueButtonTap,
                      weight: FontWeight.w500,
                      height: 40,
                      color: Theme.of(context)
                          .extension<ServiceColors>()!
                          .primary!
                          .withAlpha(200),
                    ),
                  if (canContinue) const SizedBox(width: 10),
                  _RoundButton(
                    text: "새로 풀기",
                    onTap: onNewButtonTap,
                    weight: FontWeight.w500,
                    height: 40,
                    color: Theme.of(context)
                        .extension<ServiceColors>()!
                        .primary!
                        .withAlpha(200),
                  ),
                ],
              ),
              if (onDeleteButtonTap != null || onEditButtonTap != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Wrap(
                    spacing: 15,
                    children: [
                      if (onEditButtonTap != null)
                        GestureDetector(
                          child: Icon(
                            Icons.edit,
                            size: 23,
                            color: Theme.of(context)
                                .extension<ServiceColors>()!
                                .secondaryTextGrey!
                                .withOpacity(isEditMode ? 1 : 0.6),
                          ),
                          onTap: () {
                            onEditButtonTap!();
                          },
                        ),
                      if (onDeleteButtonTap != null)
                        GestureDetector(
                          child: SvgPicture.asset(
                            ServiceAssets.deleteButton,
                            height: 23,
                            color: Theme.of(context)
                                .extension<ServiceColors>()!
                                .wrongRed!,
                          ),
                          onTap: () {
                            onDeleteButtonTap!();
                          },
                        ),
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}

class _SessionInfoListItem extends StatelessWidget {
  final int count;
  final int solvedProblem;
  final int progressTimeInSeconds;
  final bool isCompleted;
  final bool isEditMode;
  final bool isChecked;
  final Function() onStudyButtonTap;
  final Function() onReviewButtonTap;
  final Function() onCheckButtonTap;

  const _SessionInfoListItem({
    Key? key,
    required this.count,
    required this.solvedProblem,
    required this.progressTimeInSeconds,
    required this.onStudyButtonTap,
    required this.onReviewButtonTap,
    required this.isCompleted,
    required this.isEditMode,
    required this.isChecked,
    required this.onCheckButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEditMode) {
          onCheckButtonTap.call();
        } else {
          if (isCompleted) {
            onReviewButtonTap.call();
          } else {
            onStudyButtonTap.call();
          }
        }
      },
      behavior:
          isEditMode ? HitTestBehavior.translucent : HitTestBehavior.opaque,
      child: AnimatedContainer(
        width: double.infinity,
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).extension<ServiceColors>()!.white,
          border: Border.all(
            width: 1,
            color: isChecked == true
                ? Theme.of(context).extension<ServiceColors>()!.buttonOrange!
                : Theme.of(context).extension<ServiceColors>()!.white!,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              spacing: 20,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (isEditMode) CheckBox(isChecked: isChecked),
                Wrap(
                  direction: Axis.vertical,
                  spacing: 5,
                  children: [
                    Text(
                      "$count회차",
                      style: TextStyle(
                        color: Theme.of(context)
                            .extension<ServiceColors>()!
                            .textBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    isCompleted
                        ? Text(
                            "$solvedProblem점, ${progressTimeInSeconds ~/ 60}분 ${progressTimeInSeconds % 60}초 소요",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .extension<ServiceColors>()!
                                  .secondaryTextGrey,
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          )
                        : Text(
                            "✍️ 푸는 중 (${progressTimeInSeconds ~/ 60}분 ${progressTimeInSeconds % 60}초)",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .extension<ServiceColors>()!
                                  .textYellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                  ],
                ),
              ],
            ),
            isCompleted
                ? _RoundButton(
                    text: "결과 보기",
                    onTap: onReviewButtonTap,
                    fontSize: 12,
                    color: Theme.of(context)
                        .extension<ServiceColors>()!
                        .buttonGrey!
                        .withAlpha(200),
                    weight: FontWeight.w400,
                  )
                : _RoundButton(
                    text: "이어 풀기",
                    onTap: onStudyButtonTap,
                    fontSize: 12,
                    color: Theme.of(context)
                        .extension<ServiceColors>()!
                        .primary!
                        .withAlpha(150),
                  ),
          ],
        ),
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight weight;
  final double? height;

  const _RoundButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.fontSize = 15.0,
      required this.color,
      this.weight = FontWeight.w500,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: height,
            padding: EdgeInsets.fromLTRB(
              fontSize * 4 / 3,
              fontSize * 2 / 3,
              fontSize * 4 / 3,
              fontSize * 2 / 3,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: color,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).extension<ServiceColors>()!.textBlack,
                fontSize: fontSize,
                fontWeight: weight,
              ),
            ),
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
