import "package:flutter/material.dart";

import '../../ui/service_colors.dart';

class PageHeaderNavigator extends StatelessWidget {
  final MainAxisAlignment buttonAlignment;
  final List<Widget>? buttons;
  final String? title;
  final Function()? onClosed;

  const PageHeaderNavigator({
    Key? key,
    this.buttons,
    this.buttonAlignment = MainAxisAlignment.spaceBetween,
    this.title,
    this.onClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).extension<ServiceColors>()!.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).extension<ServiceColors>()!.borderGrey!,
          ),
        ),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: buttonAlignment,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Navigator.of(context).pop();
                  onClosed?.call();
                },
              ),
              ...?buttons,
            ],
          ),
          Center(
            child: Text(
              title ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
