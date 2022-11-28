import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import "../../ui/service_assets.dart";
import "../../ui/service_colors.dart";

class OXTile extends StatelessWidget {
  final bool isO;
  final double size;
  final EdgeInsets padding;

  const OXTile({
    Key? key,
    required this.isO,
    this.size = 11,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CircleAvatar(
        radius: size,
        backgroundColor: isO
            ? Theme.of(context).extension<ServiceColors>()!.buttonBlue
            : Theme.of(context).extension<ServiceColors>()!.wrongRedLight,
        child: SvgPicture.asset(
          isO ? ServiceAssets.oIcon : ServiceAssets.xIcon,
          height: size - 2,
        ),
      ),
    );
  }
}
