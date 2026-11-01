import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bookboxd/app/theme.dart';
import 'package:bookboxd/features/home/widgets/book_card.dart';
import 'package:bookboxd/main.dart';

void main() {
  testWidgets('Home shows the app name, sections and 2:3 covers', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Shelfie'), findsOneWidget);
    expect(find.text('Discover'), findsOneWidget);
    expect(find.text('Popular this week'), findsOneWidget);
    expect(find.text('New releases'), findsOneWidget);

    final size = tester.getSize(find.byType(BookCard).first);
    expect(size.width / size.height, closeTo(2 / 3, 0.001));
  });

  testWidgets('Tapping a tab shows its screen and turns it orange', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // The label appears in the nav bar and, once active, on the screen too.
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();
    expect(find.text('Search'), findsNWidgets(2));

    final bar = tester.widget<BottomNavigationBar>(
      find.byType(BottomNavigationBar),
    );
    expect(bar.currentIndex, 1);
    final icon = tester.widget<RichText>(
      find
          .descendant(
            of: find.byIcon(Icons.search),
            matching: find.byType(RichText),
          )
          .first,
    );
    expect(icon.text.style?.color, AppColors.primary);
  });

  testWidgets('Theme colors match the design', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        home: Scaffold(
          body: Column(
            children: [
              const Text('Plain'),
              ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
              FilledButton(onPressed: () {}, child: const Text('Filled')),
            ],
          ),
        ),
      ),
    );

    // The text style a widget actually ends up with.
    Color? textColor(String label) => tester
        .renderObject<RenderParagraph>(find.text(label))
        .text
        .style
        ?.color;

    expect(textColor('Plain'), AppColors.text);
    expect(textColor('Elevated'), Colors.black);
    expect(textColor('Filled'), Colors.black);
  });

  testWidgets('Home has no layout overflow on a small phone with large text', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.reset);
    addTearDown(tester.platformDispatcher.clearAllTestValues);

    await tester.pumpWidget(const MyApp());

    expect(tester.takeException(), isNull);
  });
}
