import 'package:flutter/material.dart';

import '../../app/constants.dart';
import '../../app/theme.dart';
import 'fake_books.dart';
import 'widgets/book_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // SafeArea keeps content out of the phone's status bar and notch.
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              appName,
              style: textTheme.headlineMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Discover', style: textTheme.titleLarge),
          ),
          const SizedBox(height: 16),
          const BookRow(title: 'Popular this week', books: fakeBooks),
          const SizedBox(height: 24),
          // Same fake books in reverse order, so the two rows look different.
          BookRow(title: 'New releases', books: fakeBooks.reversed.toList()),
        ],
      ),
    );
  }
}
