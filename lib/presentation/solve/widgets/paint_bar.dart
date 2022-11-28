import 'package:flutter/material.dart';

import '../../../ui/service_colors.dart';
import '../../../ui/service_icons.dart';
import '../solve_view_model.dart';

class PaintBar extends StatelessWidget {
  final bool isDarkMode;
  final SolveViewModel viewModel;

  const PaintBar(this.viewModel, this.isDarkMode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ButtonContainer(
            children: [
              _ColorButton(viewModel, Colors.black,
                  displayColor: isDarkMode ? Colors.white : Colors.black),
              _ColorButton(viewModel, Colors.red),
              _ColorButton(viewModel, const Color(0xFFFFCC00)),
              _ColorButton(viewModel, Colors.green),
              _ColorButton(viewModel, Colors.blue),
            ],
          ),
          const SizedBox(width: 10),
          _ButtonContainer(
            children: [
              _StrokeButton(viewModel, Stroke.strokeThin, isDarkMode),
              _StrokeButton(viewModel, Stroke.strokeNormal, isDarkMode),
              _StrokeButton(viewModel, Stroke.strokeBold, isDarkMode),
              _HighlightButton(viewModel, isDarkMode),
              _UndoButton(viewModel),
              _EraserButton(viewModel),
              _DeleteButton(viewModel),
            ],
          ),
        ],
      ),
    );
  }
}

class _ButtonContainer extends StatelessWidget {
  final List<Widget> children;

  const _ButtonContainer({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
      decoration: BoxDecoration(
        color: Theme.of(context).extension<ServiceColors>()!.white,
        border: Border.all(
            color: Theme.of(context).extension<ServiceColors>()!.disableGrey!,
            width: 1.5),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: children,
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final SolveViewModel viewModel;
  final Color color;
  final Color? displayColor;

  const _ColorButton(
    this.viewModel,
    this.color, {
    Key? key,
    this.displayColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        viewModel.setScribbleColor(color);
      },
      behavior: HitTestBehavior.opaque,
      child: _button(),
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: displayColor ?? color,
        ),
      ),
    );
  }
}

class _StrokeButton extends StatelessWidget {
  final SolveViewModel viewModel;
  final Stroke stroke;
  final bool isDarkMode;

  const _StrokeButton(this.viewModel, this.stroke, this.isDarkMode, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = _getHeight(stroke);
    final controller = viewModel.scribbleController;

    return GestureDetector(
      onTap: () {
        viewModel.setScribbleStroke(stroke);
      },
      behavior: HitTestBehavior.opaque,
      child: (controller.nowPenType == PenType.pen &&
              controller.nowStroke == stroke)
          ? Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const _Selected(),
                _button(height),
              ],
            )
          : _button(height),
    );
  }

  Widget _button(height) {
    Color color = viewModel.scribbleController.penColor;

    if (isDarkMode && color == const Color(0xFF000000)) {
      color = const Color(0xFFFFFFFF);
    }

    return Padding(
      padding: EdgeInsets.all(13.5 - height / 2),
      child: Container(
        width: height,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color,
        ),
      ),
    );
  }

  double _getHeight(Stroke stroke) {
    switch (stroke) {
      case Stroke.strokeBold:
        return 13;
      case Stroke.strokeNormal:
        return 10;
      case Stroke.strokeThin:
        return 7;
      case Stroke.highlight:
        return 15;
    }
  }
}

class _HighlightButton extends StatelessWidget {
  final SolveViewModel viewModel;
  final bool isDarkMode;

  const _HighlightButton(this.viewModel, this.isDarkMode, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = viewModel.scribbleController;

    return GestureDetector(
      onTap: () {
        viewModel.setScribbleStroke(Stroke.highlight);
      },
      behavior: HitTestBehavior.opaque,
      child: controller.nowPenType == PenType.highlighter
          ? Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const _Selected(),
                _button(),
              ],
            )
          : _button(),
    );
  }

  Widget _button() {
    Color color = viewModel.scribbleController.highlightColor;

    if (isDarkMode && color.value % 0x1000000 == 0) {
      color = Color((color.value ~/ 0x1000000) * 0x1000000 + 0xFFFFFF);
    }

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 15,
        height: 15,
        color: color,
      ),
    );
  }
}

class _EraserButton extends StatelessWidget {
  final SolveViewModel viewModel;

  const _EraserButton(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = viewModel.scribbleController;

    return GestureDetector(
      onTap: () {
        viewModel.selectEraser();
      },
      behavior: HitTestBehavior.opaque,
      child: controller.nowPenType == PenType.eraser
          ? Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const _Selected(),
                _button(),
              ],
            )
          : _button(),
    );
  }

  Widget _button() {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Icon(
        ServiceIcons.eraserIcon,
        size: 20,
      ),
    );
  }
}

class _UndoButton extends StatelessWidget {
  final SolveViewModel viewModel;

  const _UndoButton(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        viewModel.undoPaint();
      },
      behavior: HitTestBehavior.opaque,
      child: _button(viewModel.canUndoPaint(), context),
    );
  }

  Widget _button(bool isActive, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(
        Icons.undo,
        size: 20,
        color: isActive
            ? null
            : Theme.of(context).extension<ServiceColors>()!.disableTextGrey,
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  final SolveViewModel viewModel;

  const _DeleteButton(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        viewModel.deletePaint();
      },
      behavior: HitTestBehavior.opaque,
      child: _button(),
    );
  }

  Widget _button() {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Icon(
        Icons.clear,
        size: 20,
      ),
    );
  }
}

class _Selected extends StatelessWidget {
  const _Selected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).extension<ServiceColors>()!.disableGrey,
      ),
    );
  }
}
