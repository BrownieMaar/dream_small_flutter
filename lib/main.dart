import 'package:dream_small/src/app.dart';
import 'package:dream_small/src/pages/new_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const DreamSmallApp(),
        "/game": (context) => NewGame(),
      },
    );
  }
}
