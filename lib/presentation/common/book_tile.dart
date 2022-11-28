import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_application/ui/service_colors.dart';

import '../../domain/model/book.dart';
import '../../ui/service_assets.dart';

class BookTile extends StatelessWidget {
  final Book book;
  final bool isMyBook;

  const BookTile(this.book, this.isMyBook, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).extension<ServiceColors>()!.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Theme.of(context).extension<ServiceColors>()!.borderGrey,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  book.subject ?? "",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "BlackHanSans",
                      color: Theme.of(context)
                          .extension<ServiceColors>()!
                          .textBlack),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context)
                          .extension<ServiceColors>()!
                          .textBlack,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    book.grade != null ? "수능 & 모의고사 기출 문제" : "유저 제작 워크북",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context)
                          .extension<ServiceColors>()!
                          .secondaryTextGrey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).extension<ServiceColors>()!.dividerGrey,
            height: 0,
          ),
          SizedBox(
            height: 40,
            child: _iconButton(
              isMyBook ? ServiceAssets.penIcon : ServiceAssets.downloadIcon,
              isMyBook ? "이어서 풀기" : "서재에 담기",
              context,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconButton(String icon, String text, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: 16,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            color: Theme.of(context).extension<ServiceColors>()!.textBlack,
          ),
        ),
      ],
    );
  }
}
