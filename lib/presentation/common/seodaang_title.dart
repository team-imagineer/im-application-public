import 'package:flutter/material.dart';

import '../../ui/service_colors.dart';

class SeodaangTitle extends StatelessWidget {
  final String text;
  final bool isMini;
  final TextAlign align;

  const SeodaangTitle(
    this.text, {
    Key? key,
    this.isMini = false,
    this.align = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: isMini ? 22 : 28,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).extension<ServiceColors>()!.textBlack,
      ),
      textAlign: align,
    );
  }
}
