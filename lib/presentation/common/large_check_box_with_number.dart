import "package:flutter/material.dart";

import "../../ui/service_colors.dart";

class LargeCheckBoxWithNumber extends StatefulWidget {
  final int number;
  final List<LargeCheckBoxMenuItem> menuItems;

  const LargeCheckBoxWithNumber({
    Key? key,
    required this.number,
    required this.menuItems,
  }) : super(key: key);

  @override
  State<LargeCheckBoxWithNumber> createState() =>
      _LargeCheckBoxWithNumberState();
}

class _LargeCheckBoxWithNumberState extends State<LargeCheckBoxWithNumber> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    final numberText = "${widget.number}";
    final numberFontSize = numberText.length < 3 ? 12.0 : 9.0;
    final majorColor = clicked
        ? Theme.of(context).extension<ServiceColors>()!.shadowGrey!
        : Theme.of(context).extension<ServiceColors>()!.buttonOrange!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: Tween<double>(begin: 0.2, end: 1).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(0.2, 0), end: const Offset(0, 0))
                  .animate(animation),
              child: child,
            ),
          ),
          child: clicked
              ? Wrap(
            spacing: 10.0,
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: List.from(
                    widget.menuItems.map(
                      (e) => MenuButton(
                        majorColor: e.color,
                        onTap: e.onTap,
                        text: e.text,
                      ),
                    ),
                  ),
                )
              : null,
        ),
        const SizedBox(height: 5),
        Stack(
          alignment: Alignment.topRight,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  clicked = !clicked;
                });
              },
              child: CheckCircle(
                clicked: clicked,
                majorColor: majorColor,
              ),
            ),
            NumberCircle(
              majorColor: majorColor,
              fontSize: numberFontSize,
              text: numberText,
            ),
          ],
        ),
      ],
    );
  }
}

class MenuButton extends StatelessWidget {
  final Color majorColor;
  final Function() onTap;
  final String text;

  const MenuButton({
    Key? key,
    required this.majorColor,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: majorColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).extension<ServiceColors>()!.textBlack,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CheckCircle extends StatelessWidget {
  final bool clicked;
  final Color majorColor;

  const CheckCircle({
    Key? key,
    required this.clicked,
    required this.majorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 60,
      height: 60,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: majorColor,
      ),
      duration: const Duration(milliseconds: 200),
      child: Center(
        child: Icon(
          clicked ? Icons.close : Icons.check,
          size: 35,
          color: Theme.of(context).extension<ServiceColors>()!.white,
        ),
      ),
    );
  }
}

class NumberCircle extends StatelessWidget {
  final Color majorColor;
  final double fontSize;
  final String text;

  const NumberCircle({
    Key? key,
    required this.majorColor,
    required this.fontSize,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Theme.of(context).extension<ServiceColors>()!.white,
        border: Border.all(
          color: majorColor,
          width: 2.0,
        ),
      ),
      duration: const Duration(milliseconds: 200),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: majorColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class LargeCheckBoxMenuItem {
  final String text;
  final Color color;
  final Function() onTap;

  LargeCheckBoxMenuItem(this.text, this.color, this.onTap);
}
