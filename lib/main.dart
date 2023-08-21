import 'package:flutter/material.dart';
import 'package:music_app/components/colors.dart';
import 'package:music_app/screens/music_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: myTextTheme(),
        scaffoldBackgroundColor: MyColors.primary,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MusicScreen(),
    );
  }

  TextTheme myTextTheme() {
    return TextTheme(
        headlineSmall: TextStyle(
          color: MyColors.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        headlineLarge: const TextStyle(
          color: Colors.white60,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        bodySmall: TextStyle(
            color: MyColors.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 10),
      );
  }
}
