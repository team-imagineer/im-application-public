import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";

import '../../domain/model/problem_data.dart';
import '../../ui/manager/theme_manager.dart';
import '../../ui/service_colors.dart';
import 'check_box.dart';

class ProblemTile extends StatelessWidget {
  final Widget? header;
  final ProblemData problemData;
  final bool? isChecked;

  const ProblemTile({
    Key? key,
    required this.problemData,
    required this.isChecked,
    this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 80 - 10;
    final isSmall = width < 600;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).extension<ServiceColors>()!.white,
        border: Border.all(
          width: 1,
          color: isChecked == true
              ? Theme.of(context).extension<ServiceColors>()!.buttonOrange!
              : Theme.of(context).extension<ServiceColors>()!.white!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 8,
                children: [
                  Text(
                    problemData.bookTitle.replaceAll("대학수학능력시험", "수능"),
                    style: TextStyle(
                      color: Theme.of(context)
                          .extension<ServiceColors>()!
                          .textBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: isSmall ? 12 : 15,
                    ),
                  ),
                  Text(
                    "${problemData.subject.replaceAll("화법과 작문", "화작").replaceAll("언어와 매체", "언매")} ${problemData.problem.indexNumber}번",
                    style: TextStyle(
                      color: Theme.of(context)
                          .extension<ServiceColors>()!
                          .textBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: isSmall ? 12 : 15,
                    ),
                  ),
                ],
              ),
              if (isChecked != null) CheckBox(isChecked: isChecked!),
            ],
          ),
          const SizedBox(height: 5),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 5,
            children: [
              if (problemData.category != null)
                _Tag(
                    problemData.category!,
                    Theme.of(context)
                        .extension<ServiceColors>()!
                        .buttonLightGrey!,
                    Theme.of(context).extension<ServiceColors>()!.textBlack!,
                    isSmall),
              if (problemData.lowCategory != null)
                _Tag(
                    problemData.lowCategory!,
                    Theme.of(context)
                        .extension<ServiceColors>()!
                        .buttonLightGrey!,
                    Theme.of(context).extension<ServiceColors>()!.textBlack!,
                    isSmall),
              // _WrongRateTag(rate: problemData.wrongRate),
            ],
          ),
          const SizedBox(height: 10),
          _BlurredImage(imageUrl: problemData.problem.question.imageUrl),
          if (header != null) header!,
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final bool isSmall;

  const _Tag(this.text, this.backgroundColor, this.textColor, this.isSmall,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: backgroundColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isSmall ? 9 : 11,
          color: textColor,
        ),
      ),
    );
  }
}

class _BlurredImage extends StatelessWidget {
  final String imageUrl;

  const _BlurredImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => const SizedBox(),
            errorWidget: (context, url, error) => const SizedBox(),
            fadeInDuration: const Duration(milliseconds: 0),
            fadeOutDuration: const Duration(milliseconds: 0),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
            imageBuilder: (context, imageProvider) {
              final image = Image(
                image: imageProvider,
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              );
              if (Theme.of(context).brightness == Brightness.dark) {
                return ColorFiltered(
                  colorFilter: ThemeManager.reverseFilter,
                  child: image,
                );
              } else {
                return image;
              }
            },
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context)
                      .extension<ServiceColors>()!
                      .white!
                      .withAlpha(0),
                  Theme.of(context)
                      .extension<ServiceColors>()!
                      .white!
                      .withAlpha(200),
                  Theme.of(context)
                      .extension<ServiceColors>()!
                      .white!
                      .withAlpha(255)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.4, 0.8, 1],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
