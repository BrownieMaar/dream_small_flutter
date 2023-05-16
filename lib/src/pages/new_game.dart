import 'package:flutter/material.dart';

class NewGame extends StatefulWidget {
  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var nameController = TextEditingController();

    final Map<String, String>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final int numberAmount = int.parse(arguments?['numberAmount'] ?? "5");

    var numberControllers =
        List.generate(numberAmount, (index) => TextEditingController());

    var numberInputs = List.generate(numberAmount, (index) {
      return TextField(
        controller: numberControllers.elementAt(index),
        decoration: InputDecoration(
            border: OutlineInputBorder(), label: Text("Number ${index + 1}.")),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Dream Small"),
        foregroundColor: theme.colorScheme.onPrimary,
        backgroundColor: theme.colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Add players",
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Player name"),
              ),
            ),
            SizedBox(height: 20),
            ...numberInputs
                .expand((element) => [element, SizedBox(height: 10)]),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: OutlinedButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.shuffle),
                    label: Text("Fill randomly"),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  fit: FlexFit.tight,
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.send),
                    label: Text("Submit player"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
