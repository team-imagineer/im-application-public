import 'package:flutter/material.dart';
import 'package:im_application/data/source/model/result.dart';

class ErrorSnackBar extends SnackBar {
  final ApiError error;

  ErrorSnackBar({Key? key, required this.error, required BuildContext context})
      : super(
          key: key,
          content: Text(error.toErrorMessage() ?? ""),
        );

  void show(BuildContext context) {
    if (error.toErrorMessage() == null) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(this);
  }
}
