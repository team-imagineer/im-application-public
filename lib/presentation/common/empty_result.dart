import "package:flutter/material.dart";
import 'package:im_application/presentation/common/seodaang_title.dart';

import '../../ui/service_assets.dart';
import '../../ui/service_colors.dart';

class EmptyResult extends StatelessWidget {
  final String title;
  final String? buttonText;
  final Function()? onTap;

  const EmptyResult({
    Key? key,
    required this.title,
    this.buttonText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 10,
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(
            ServiceAssets.notFound,
            width: 100,
          ),
          SeodaangTitle(
            title,
            isMini: true,
            align: TextAlign.center,
          ),
          if (onTap != null && buttonText != null)
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context)
                      .extension<ServiceColors>()!
                      .buttonGrey!
                      .withAlpha(100),
                ),
                child: Text(
                  buttonText!,
                  style: TextStyle(
                      color: Theme.of(context)
                          .extension<ServiceColors>()!
                          .secondaryTextGrey),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
