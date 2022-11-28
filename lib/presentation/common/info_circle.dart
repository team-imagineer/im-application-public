import "package:flutter/material.dart";

import "../../ui/service_colors.dart";

class InfoCircle extends StatelessWidget {
  final String circleTitle;
  final String circleContent;
  final Color circleColor;
  final double width;
  final double strokeWidth;
  final double value;

  const InfoCircle({
    Key? key,
    required this.circleTitle,
    required this.circleContent,
    required this.circleColor,
    required this.width,
    this.strokeWidth = 5.0,
    this.value = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width,
      child: Stack(
        children: [
          SizedBox(
            width: width,
            height: width,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              value: value,
              color: circleColor,
            ),
          ),
          Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              spacing: 3,
              children: [
                Text(
                  circleTitle,
                  style: TextStyle(
                    color: Theme.of(context)
                        .extension<ServiceColors>()!
                        .secondaryTextGrey,
                    fontSize: 11,
                  ),
                ),
                Text(
                  circleContent,
                  style: TextStyle(
                    color: circleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
