import "package:flutter/material.dart";

import '../../domain/model/book.dart';
import 'book_tile.dart';

class BookGrid extends StatelessWidget {
  final ScrollController? controller;
  final List<Book> books;
  final List<Function()> onTaps;
  final bool? isMyBook;
  List<bool>? areMyBooks;
  final Function()? onScrollEnd;

  BookGrid({
    Key? key,
    required this.books,
    required this.onTaps,
    this.isMyBook,
    this.areMyBooks,
    this.onScrollEnd,
    this.controller,
  }) : super(key: key) {
    assert(isMyBook != null || areMyBooks != null,
        "isMyBook과 areMyBooks 중 하나는 무조건 지정되어야 합니다.");
    assert(isMyBook == null || areMyBooks == null,
        "isMyBook과 areMyBooks 중 하나만 지정되어야 합니다.");
    areMyBooks ??= List.generate(books.length, (index) => isMyBook!);
  }

  @override
  Widget build(BuildContext context) {
    final count = books.length + (onScrollEnd != null ? 1 : 0);
    final scrollController = controller ?? ScrollController();

    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 20.0),
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width ~/ 230,
        childAspectRatio: 230 / 180,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: count,
      itemBuilder: (context, index) {
        if (index < books.length) {
          return GestureDetector(
            onTap: onTaps[index],
            child: BookTile(books[index], areMyBooks![index]),
          );
        } else {
          onScrollEnd?.call();
          return const SizedBox();
        }
      },
    );
  }
}
