import 'package:dream_small/src/widgets/player_inputs.dart';
import 'package:flutter/material.dart';

class PlayerTicket {
  final String name;
  final List<int> numbers;

  PlayerTicket(this.name, this.numbers);
}

class NewGame extends StatefulWidget {
  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  List<PlayerTicket> playerTickets = [];

  addTicket(PlayerTicket ticket) {
    setState(() {
      playerTickets.add(ticket);
    });
    for (var ticket in playerTickets) {
      print(ticket.name);
    }
  }

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
        child: Column(
          children: [
            PlayerInputs(
              numberAmount: numberAmount,
              onSubmit: addTicket,
            ),
            SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 8,
              children: [
                ...playerTickets.map((e) => Chip(
                  avatar: Icon(Icons.person),
                      label: Text(e.name),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
