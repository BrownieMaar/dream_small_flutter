import 'package:flutter/material.dart';

class NewGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final int numberAmount = int.parse(arguments?['numberAmount'] ?? "5");

    return Scaffold(
      appBar: AppBar(
        title: Text("placeholder"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("placeholder"),
            Text(numberAmount.toString()),
          ],
        ),
      ),
    );
  }
}
