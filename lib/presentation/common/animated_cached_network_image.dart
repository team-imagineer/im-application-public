import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:im_application/presentation/common/empty_result.dart';

import '../../ui/service_colors.dart';

class AnimatedCachedNetworkImage extends StatefulWidget {
  final String url;
  final bool isDarkMode;
  final double? width;
  final Widget Function(BuildContext context, ImageProvider imageProvider)?
      imageBuilder;
  final Duration duration;
  final Alignment alignment;
  final BoxFit? boxFit;
  final Widget? errorWidget;

  const AnimatedCachedNetworkImage({
    Key? key,
    required this.url,
    required this.isDarkMode,
    this.width,
    this.imageBuilder,
    this.errorWidget,
    this.duration = const Duration(milliseconds: 300),
    this.alignment = Alignment.topCenter,
    this.boxFit = BoxFit.fitWidth,
  }) : super(key: key);

  @override
  State<AnimatedCachedNetworkImage> createState() =>
      _AnimatedCachedNetworkImageState();
}

class _AnimatedCachedNetworkImageState
    extends State<AnimatedCachedNetworkImage> {
  late Duration duration = const Duration(milliseconds: 0);

  @override
  Widget build(BuildContext context) {
    Widget result = TweenAnimationBuilder(
      tween: Tween<double>(
        begin: widget.isDarkMode ? 1 : -1,
        end: widget.isDarkMode ? -1 : 1,
      ),
      duration: duration,
      builder: (_, double val, __) => ColorFiltered(
        colorFilter: ColorFilter.matrix([
          val,
          0,
          0,
          0,
          -255 * val / 2 + 255 / 2,
          0,
          val,
          0,
          0,
          -255 * val / 2 + 255 / 2,
          0,
          0,
          val,
          0,
          -250 * val / 2 + 250 / 2,
          0,
          0,
          0,
          1,
          0
        ]),
        child: CachedNetworkImage(
          width: widget.width,
          imageUrl: widget.url,
          placeholder: (context, url) => Container(
            width: widget.width,
            alignment: Alignment.center,
            child: const LoadingWidget(),
          ),
          errorWidget: (context, url, error) {
            print("IMAGE LOAD ERROR $error");
            return widget.errorWidget ?? const EmptyResult(title: "Error");
          },
          fadeInDuration: const Duration(milliseconds: 0),
          fadeOutDuration: const Duration(milliseconds: 0),
          alignment: widget.alignment,
          fit: widget.boxFit,
          imageBuilder: widget.imageBuilder,
        ),
      ),
    );

    duration = widget.duration;
    return result;
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          "Loading...",
          textStyle: TextStyle(
            fontSize: 13.0,
            color:
                Theme.of(context).extension<ServiceColors>()!.disableTextGrey!,
          ),
          textAlign: TextAlign.center,
          colors: [
            Theme.of(context).extension<ServiceColors>()!.disableTextGrey!,
            Theme.of(context).extension<ServiceColors>()!.disableTextGrey!,
            Theme.of(context).extension<ServiceColors>()!.white!,
            Theme.of(context).extension<ServiceColors>()!.disableTextGrey!,
            Theme.of(context).extension<ServiceColors>()!.disableTextGrey!,
          ],
        ),
      ],
      pause: const Duration(milliseconds: 500),
      repeatForever: true,
    );
  }
}
