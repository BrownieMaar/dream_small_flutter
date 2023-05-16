import 'package:dream_small/src/app.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

String textFromWP(WordPair wp) {
  return "${wp.first} ${wp.second}";
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
        "/game": (context) => Builder(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("placeholder"),
                ),
                body: Column(
                  children: [
                    Center(child: Text("placeholder")),
                  ],
                ),
              );
            }),
      },
    );
  }
}
