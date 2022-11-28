import 'package:flutter/material.dart';

import '../../ui/service_colors.dart';

class AnswerInput extends StatelessWidget {
  final bool isSolving;
  final int? userInput;
  final int? answer;
  final Function(int number)? onButtonTap;

  const AnswerInput({
    Key? key,
    required this.isSolving,
    this.userInput,
    this.answer,
    this.onButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context)
                .extension<ServiceColors>()!
                .buttonBorderGrey!),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            "정답 체크",
            style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).extension<ServiceColors>()!.textBlack),
          ),
          Wrap(
            spacing: -5,
            children: List<Widget>.generate(
              5,
              (index) => _AnswerNumberButton(
                number: index + 1,
                isSolving: isSolving,
                isChecked: userInput == index + 1,
                isAnswer: answer == index + 1,
                onTap: () {
                  if (onButtonTap != null) onButtonTap!(index + 1);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnswerNumberButton extends StatelessWidget {
  final int number;
  final bool isSolving;
  final bool isChecked;
  final bool isAnswer;
  final Function() onTap;

  const _AnswerNumberButton({
    Key? key,
    required this.number,
    required this.isSolving,
    required this.isChecked,
    required this.isAnswer,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor, textColor, borderColor;

    if (isAnswer) {
      buttonColor = Theme.of(context).extension<ServiceColors>()!.rightBlue!;
      textColor = Theme.of(context).extension<ServiceColors>()!.white!;
      borderColor = Theme.of(context).extension<ServiceColors>()!.rightBlue!;
    } else if (isChecked) {
      if (isSolving) {
        buttonColor = Theme.of(context).extension<ServiceColors>()!.buttonGrey!;
        textColor = Theme.of(context).extension<ServiceColors>()!.textBlack!;
        borderColor = Theme.of(context).extension<ServiceColors>()!.textBlack!;
      } else {
        buttonColor =
            Theme.of(context).extension<ServiceColors>()!.wrongRedLight!;
        textColor = Theme.of(context).extension<ServiceColors>()!.wrongRed!;
        borderColor = Theme.of(context).extension<ServiceColors>()!.wrongRed!;
      }
    } else {
      buttonColor = Theme.of(context).extension<ServiceColors>()!.white!;
      textColor = Theme.of(context).extension<ServiceColors>()!.textBlack!;
      borderColor =
          Theme.of(context).extension<ServiceColors>()!.buttonBorderGrey!;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
