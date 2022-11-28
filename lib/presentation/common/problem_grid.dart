import "package:flutter/material.dart";
import 'package:im_application/presentation/common/problem_tile.dart';

import '../../domain/model/problem_data.dart';

class ProblemGrid extends StatelessWidget {
  final ScrollController? controller;
  final List<ProblemData> problems;
  final List<Function()> onTaps;
  final List<bool> isChecked;
  final Function()? onScrollEnd;

  const ProblemGrid({
    Key? key,
    required this.problems,
    required this.onTaps,
    required this.isChecked,
    this.controller,
    this.onScrollEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = problems.length + (onScrollEnd != null ? 1 : 0);
    final scrollController = controller ?? ScrollController();

    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 20.0),
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width ~/ 300,
        childAspectRatio: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: count,
      itemBuilder: (context, index) {
        if (index < problems.length) {
          return GestureDetector(
            onTap: onTaps[index],
            child: ProblemTile(
              problemData: problems[index],
              isChecked: isChecked[index],
            ),
          );
        } else {
          onScrollEnd?.call();
          return const SizedBox();
        }
      },
    );
  }
}
