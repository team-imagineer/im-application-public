import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:im_application/domain/model/problem_review_data.dart";
import "package:im_application/presentation/review/review_detail_view_model.dart";
import "package:provider/provider.dart";
import "package:scribble/scribble.dart";

import "../../ui/service_colors.dart";
import "../common/answer_input.dart";
import "../common/ox_tile.dart";
import "../common/page_header_navigator.dart";

class ReviewDetailScreen extends StatelessWidget {
  final ProblemReviewData problemReviewData;

  const ReviewDetailScreen({Key? key, required this.problemReviewData})
      : super(key: key);

  Widget _buildBody(BuildContext context, ReviewDetailViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: double.infinity,
            alignment: Alignment.center,
            color: Theme.of(context).extension<ServiceColors>()!.white,
            child: _buildProblem(context, viewModel),
          ),
        ),
        const VerticalDivider(width: 0),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: _buildList(context, viewModel),
          ),
        ),
      ],
    );
  }

  Widget _buildProblem(BuildContext context, ReviewDetailViewModel viewModel) {
    final width = MediaQuery.of(context).size.width - 40;
    final isSmall = width < 600;

    final score = problemReviewData.problemData.problem.score;
    final ScribbleNotifier notifier = viewModel.scribbleNotifier;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                problemReviewData.problemData.name,
                style: TextStyle(
                  color:
                      Theme.of(context).extension<ServiceColors>()!.textBlack,
                  fontSize: isSmall ? 13 : 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 5,
                children: [
                  if (problemReviewData.problemData.category != null)
                    _Tag(
                      problemReviewData.problemData.category!,
                      Theme.of(context)
                          .extension<ServiceColors>()!
                          .buttonLightGrey!,
                      Theme.of(context).extension<ServiceColors>()!.textBlack!,
                      isSmall,
                    ),
                  if (problemReviewData.problemData.lowCategory != null)
                    _Tag(
                      problemReviewData.problemData.lowCategory!,
                      Theme.of(context)
                          .extension<ServiceColors>()!
                          .buttonLightGrey!,
                      Theme.of(context).extension<ServiceColors>()!.textBlack!,
                      isSmall,
                    ),
                  if (score != null)
                    _Tag(
                      "$score점",
                      score == 4
                          ? Theme.of(context)
                              .extension<ServiceColors>()!
                              .buttonRed!
                          : score == 3
                              ? Theme.of(context)
                                  .extension<ServiceColors>()!
                                  .buttonYellow!
                              : Theme.of(context)
                                  .extension<ServiceColors>()!
                                  .buttonBlue!,
                      Theme.of(context).extension<ServiceColors>()!.textBlack!,
                      isSmall,
                    ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          key: notifier.scribbleKey,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
              child: CachedNetworkImage(
                imageUrl:
                    problemReviewData.problemData.problem.question.imageUrl,
              ),
            ),
            Positioned.fill(
              child: Scribble(
                notifier: notifier,
                drawPen: false,
                drawEraser: false,
              ),
            ),
          ],
        ),
        Center(
          child: AnswerInput(
            isSolving: false,
            userInput:
                problemReviewData.histories[viewModel.state.index].response,
            answer: problemReviewData.problemData.problem.correctAnswer,
          ),
        ),
      ],
    );
  }

  Widget _buildList(BuildContext context, ReviewDetailViewModel viewModel) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: problemReviewData.histories.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          viewModel.chooseLearning(index);
        },
        child: _HistoryItem(
          problemReviewData,
          index,
          index == viewModel.state.index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ReviewDetailViewModel>();
    viewModel.init(context, problemReviewData);

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).extension<ServiceColors>()!.backgroundGrey,
          child: Column(
            children: [
              PageHeaderNavigator(title: problemReviewData.problemData.name),
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

class _Tag extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final bool isSmall;

  const _Tag(this.text, this.backgroundColor, this.textColor, this.isSmall,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: backgroundColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isSmall ? 9 : 11,
          color: textColor,
        ),
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final ProblemReviewData problemReviewData;
  final int index;
  final bool isSelected;

  const _HistoryItem(this.problemReviewData, this.index, this.isSelected,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final history = problemReviewData.histories[index];
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? Theme.of(context).extension<ServiceColors>()!.primary!
              : Theme.of(context).extension<ServiceColors>()!.white!,
        ),
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).extension<ServiceColors>()!.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            spacing: 10,
            children: [
              Text(
                "${index + 1}회차",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color:
                      Theme.of(context).extension<ServiceColors>()!.textBlack,
                ),
              ),
              Text(
                "${history.solvedTime.year}.${history.solvedTime.month}.${history.solvedTime.day} ${history.solvedTime.hour}:${history.solvedTime.minute}",
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context)
                      .extension<ServiceColors>()!
                      .secondaryTextGrey,
                ),
              ),
            ],
          ),
          OXTile(
            isO: problemReviewData.corrections[index],
          ),
        ],
      ),
    );
  }
}
