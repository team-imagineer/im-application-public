import "package:flutter/material.dart";

import "../../ui/service_colors.dart";

class CheckBox extends StatelessWidget {
  final bool isChecked;

  const CheckBox({Key? key, required this.isChecked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: isChecked
              ? Theme.of(context).extension<ServiceColors>()!.buttonOrange!
              : Theme.of(context).extension<ServiceColors>()!.buttonBorderGrey!,
        ),
        color: isChecked
            ? Theme.of(context).extension<ServiceColors>()!.buttonOrange
            : Theme.of(context).extension<ServiceColors>()!.white,
      ),
      child: Center(
        child: Icon(
          Icons.check,
          size: 13,
          color: Theme.of(context).extension<ServiceColors>()!.white,
        ),
      ),
    );
  }
}

