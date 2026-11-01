import 'package:flutter/material.dart';

import '../fake_books.dart';
import 'book_card.dart';

// A section title with a horizontally scrolling row of books under it.
class BookRow extends StatelessWidget {
  final String title;
  final List<Book> books;

  const BookRow({super.key, required this.title, required this.books});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(height: 8),
        // A horizontal ListView needs a fixed height. Each card's width
        // is then worked out from this height (see BookCard).
        SizedBox(
          // Sized so the next cover peeks in, hinting that the row scrolls.
          height: 165,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: books.length,
            // .builder/.separated only build the cards currently on screen.
            itemBuilder: (context, index) => BookCard(book: books[index]),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        ),
      ],
    );
  }
}
