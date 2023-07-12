import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';
// import 'package:meals/data/data.dart';
// import 'package:meals/screens/mealscreen.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.blueGrey,
);

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    bodyMedium: TextStyle(
      color: colorScheme.primary,
    ),
    bodySmall: TextStyle(
      color: colorScheme.secondary,
    ),
    titleLarge: TextStyle(
      color: colorScheme.tertiary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      theme: theme,
      home: const Tabs(),
    );
  }
}
