import 'package:dream_small/src/widgets/player_inputs.dart';
import 'package:flutter/material.dart';

class NewGame extends StatefulWidget {
  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    final Map<String, String>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final int numberAmount = int.parse(arguments?['numberAmount'] ?? "5");

    return Scaffold(
      appBar: AppBar(
        title: Text("Dream Small"),
        foregroundColor: theme.colorScheme.onPrimary,
        backgroundColor: theme.colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: PlayerInputs(numberAmount: numberAmount),
      ),
    );
  }
}


