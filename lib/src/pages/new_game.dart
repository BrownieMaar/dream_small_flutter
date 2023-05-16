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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlayerInputs(
              numberAmount: numberAmount,
              onSubmit: addTicket,
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Submitted:",
                  style: theme.textTheme.headlineSmall,
                ),
                SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8,
                  children: [
                    ...playerTickets.asMap().entries.map((e) {
                      return Chip(
                        avatar: Icon(Icons.person),
                        label: Text(e.value.name),
                        onDeleted: () {
                          setState(() {
                            playerTickets.removeAt(e.key);
                          });
                        },
                      );
                    }),
                    if (playerTickets.isEmpty) Text("No tickets yet."),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: null,
                        icon: Icon(Icons.calculate),
                        label: Text(
                          "Get results",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
