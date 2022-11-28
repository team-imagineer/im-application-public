import 'package:flutter/material.dart';

import '../../ui/service_colors.dart';

class SeodaangDialog extends StatelessWidget {
  final String title;
  Widget? content;
  final String positiveText;
  final String negativeText;
  final Function()? onPositiveClicked;
  final Function()? onNegativeClicked;
  final Color? backgroundColor;

  SeodaangDialog({
    Key? key,
    required this.title,
    required this.content,
    this.positiveText = "예",
    this.negativeText = "아니오",
    this.onPositiveClicked,
    this.onNegativeClicked,
    this.backgroundColor,
  }) : super(key: key);

  SeodaangDialog.withText({
    Key? key,
    required this.title,
    required String text,
    this.positiveText = "예",
    this.negativeText = "아니오",
    this.onPositiveClicked,
    this.onNegativeClicked,
    this.content,
    this.backgroundColor,
  }) : super(key: key) {
    content = SeodaangDialogText(text);
  }

  Widget _buildButtons(BuildContext context) {
    final hasPositive = positiveText != "" && onPositiveClicked != null;
    final hasNegative = negativeText != "" && onNegativeClicked != null;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasPositive)
            Expanded(
              child: _SeodaangDialogButton(
                text: positiveText,
                onTap: onPositiveClicked,
                color: Theme.of(context)
                    .extension<ServiceColors>()!
                    .buttonPrimary!,
              ),
            ),
          if (hasPositive && hasNegative) const SizedBox(width: 10.0),
          if (hasNegative)
            Expanded(
              child: _SeodaangDialogButton(
                text: negativeText,
                onTap: onNegativeClicked,
                color: Theme.of(context).extension<ServiceColors>()!.white!,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      backgroundColor: Theme.of(context).extension<ServiceColors>()!.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
        child: IntrinsicWidth(
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color:
                        Theme.of(context).extension<ServiceColors>()!.textBlack,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                if (content != null)
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      10,
                      backgroundColor != null ? 10.0 : 0.0,
                      10,
                      backgroundColor != null ? 10.0 : 0.0,
                    ),
                    color: backgroundColor,
                    child: content!,
                  ),
                _buildButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SeodaangDialogText extends StatelessWidget {
  final String text;
  final Color? color;

  const SeodaangDialogText(this.text, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Theme.of(context).extension<ServiceColors>()!.textBlack,
        fontSize: 15,
        height: 1.4,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _SeodaangDialogButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color color;

  const _SeodaangDialogButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: Theme.of(context).extension<ServiceColors>()!.buttonPrimary!,
            width: 2.5,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).extension<ServiceColors>()!.textBlack,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
