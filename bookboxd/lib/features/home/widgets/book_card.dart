import 'package:flutter/material.dart';

import '../../../app/theme.dart';
import '../fake_books.dart';

// A placeholder book cover: a rounded grey card showing the title.
class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    // 2:3 means width / height = 2 / 3, the shape of a typical book cover.
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.cover,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          book.title,
          textAlign: TextAlign.center,
          maxLines: 4,
          overflow: TextOverflow.ellipsis, // Long titles end with "..."
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
