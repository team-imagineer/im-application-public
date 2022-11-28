import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';

import '../../ui/service_assets.dart';
import '../../ui/service_colors.dart';

class SearchBar extends StatelessWidget {
  final int maxLine;
  final bool showIcon;
  final String placeHolder;
  final TextEditingController controller;
  final Function(String data)? onSubmit;

  const SearchBar({
    Key? key,
    required this.placeHolder,
    required this.controller,
    this.showIcon = true,
    this.maxLine = 1,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: showIcon ? 50 : null,
      width: double.infinity,
      child: TextField(
        controller: controller,
        textInputAction:
            showIcon ? TextInputAction.search : TextInputAction.done,
        cursorColor: Theme.of(context).extension<ServiceColors>()!.buttonOrange,
        decoration: InputDecoration(
          suffixIcon: showIcon
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    child: SvgPicture.asset(ServiceAssets.searchButton),
                    onTap: () {
                      onSubmit?.call(controller.text);
                    },
                  ),
                )
              : null,
          hintText: placeHolder,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context)
                    .extension<ServiceColors>()!
                    .buttonBorderGrey!),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context)
                    .extension<ServiceColors>()!
                    .buttonOrange!),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Theme.of(context).extension<ServiceColors>()!.white,
          contentPadding: maxLine == 1
              ? const EdgeInsets.fromLTRB(20, 5, 20, 0)
              : const EdgeInsets.all(10),
        ),
        maxLines: maxLine,
        onSubmitted: onSubmit,
      ),
    );
  }
}
