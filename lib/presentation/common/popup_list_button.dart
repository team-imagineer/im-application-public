import "package:flutter/material.dart";

import '../../ui/service_colors.dart';

class PopupListButton extends StatelessWidget {
  final Icon icon;
  final List<String> itemTitles;
  final List<dynamic> onTaps;

  const PopupListButton(
      {Key? key,
      required this.icon,
      required this.itemTitles,
      required this.onTaps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: icon,
      itemBuilder: (context) => List.generate(
        itemTitles.length * 2 - 1,
        (n) {
          final index = n ~/ 2;
          final isDivider = n % 2 == 1;

          return isDivider
              ? const PopupMenuDivider(height: 10)
              : PopupMenuItem<int>(
                  value: index,
                  height: 25.0,
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    itemTitles[index],
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context)
                          .extension<ServiceColors>()!
                          .textBlack,
                    ),
                  ),
                ) as PopupMenuEntry<int>;
        },
      ),
      onSelected: (int value) {
        onTaps[value].call(context);
      },
      offset: const Offset(-5, 45),
      elevation: 1.5,
      padding: const EdgeInsets.all(0.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(7.0),
          bottomRight: Radius.circular(7.0),
          topLeft: Radius.circular(7.0),
        ),
      ),
      splashRadius: 1,
    );
  }
}
