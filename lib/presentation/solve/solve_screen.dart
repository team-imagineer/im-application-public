import 'package:flutter/material.dart';
import 'package:im_application/domain/model/solve/book_content.dart';
import 'package:im_application/presentation/solve/solve_state.dart';
import 'package:im_application/presentation/solve/solve_view_model.dart';
import 'package:im_application/presentation/solve/widgets/bottom_bar.dart';
import 'package:im_application/presentation/solve/widgets/paint_bar.dart';
import 'package:im_application/presentation/solve/widgets/passage_area.dart';
import 'package:im_application/presentation/solve/widgets/problem_area.dart';
import 'package:provider/provider.dart';

import '../../domain/model/book.dart';
import '../../domain/model/learning.dart';
import '../../ui/manager/theme_manager.dart';
import '../../ui/service_colors.dart';
import '../../ui/service_icons.dart';
import '../common/popup_list_button.dart';

class SolveScreen extends StatelessWidget {
  final BookContent? content;
  final Book? book;
  final Learning learning;
  final SolveMode solveMode;

  const SolveScreen({
    Key? key,
    required this.learning,
    this.content,
    this.book,
    required this.solveMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<ThemeManager>();
    final viewModel = context.watch<SolveViewModel>();

    if (content != null) {
      viewModel.initWithContent(context, content!, learning, solveMode);
    } else {
      viewModel.init(book!, learning, solveMode, context);
    }

    return AnimatedTheme(
      data: themeManager.getNowThemeData(),
      duration: const Duration(milliseconds: 300),
      child: _Body(
        isDark: themeManager.themeMode == ThemeMode.dark,
        viewModel: viewModel,
        onThemeChangeClicked: () {
          themeManager.reverseMode();
          viewModel.changeThemeMode();
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final bool isDark;
  final SolveViewModel viewModel;
  final Function() onThemeChangeClicked;

  const _Body(
      {Key? key,
      required this.isDark,
      required this.viewModel,
      required this.onThemeChangeClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: IconButton(
          key: viewModel.problemJumpIcon,
          icon: const Icon(Icons.dataset_outlined),
          onPressed: () => {
            viewModel.showAllProblems(context, isDark),
          },
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            viewModel.finish(context);
          },
        ),
        backgroundColor: Theme.of(context).extension<ServiceColors>()!.white,
        foregroundColor:
            Theme.of(context).extension<ServiceColors>()!.textBlack,
        actions: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.05, 0), end: const Offset(0, 0))
                    .animate(animation),
                child: child,
              ),
            ),
            child: viewModel.state?.isPenToolVisible == true
                ? PaintBar(viewModel, isDark)
                : null,
          ),
          const SizedBox(width: 10),
          Center(
            child: IconButton(
              icon: Icon(
                ServiceIcons.penIcon,
                color: viewModel.state?.isPenToolVisible == true
                    ? Theme.of(context).extension<ServiceColors>()!.rightBlue
                    : null,
              ),
              onPressed: () {
                viewModel.clickPenTool();
              },
            ),
          ),
          const SizedBox(width: 10),
          Center(
            child: IconButton(
              icon: Icon(
                isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
              ),
              onPressed: onThemeChangeClicked,
            ),
          ),
          const SizedBox(width: 10),
          PopupListButton(
            icon: const Icon(
              Icons.more_vert,
            ),
            itemTitles: viewModel.popUpMenuTitles,
            onTaps: viewModel.popUpMenuActions,
          ),
        ],
        elevation: 0.5,
      ),
      body: Container(
        color: Theme.of(context).extension<ServiceColors>()!.white,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  PassageArea(viewModel, isDark),
                  const VerticalDivider(
                    thickness: 1,
                    width: 1,
                  ),
                  ProblemArea(viewModel, isDark),
                ],
              ),
            ),
            LinearProgressIndicator(
              color: Theme.of(context).extension<ServiceColors>()!.primary,
              backgroundColor:
                  Theme.of(context).extension<ServiceColors>()!.backgroundGrey,
              value: viewModel.state != null && viewModel.content != null
                  ? (viewModel.state!.nowIndex + 1) /
                      viewModel.content!.problemSets.length
                  : 0,
            ),
            BottomBar(viewModel, isDark),
          ],
        ),
      ),
    );
  }
}
