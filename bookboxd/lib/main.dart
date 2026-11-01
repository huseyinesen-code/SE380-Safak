import 'package:flutter/material.dart';

import 'app/app_shell.dart';
import 'app/constants.dart';
import 'app/theme.dart';

void main() {
  runApp(const MyApp());
}

// The root widget: sets the app-wide theme and the first screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: AppTheme.dark,
      home: const AppShell(),
    );
  }
}
