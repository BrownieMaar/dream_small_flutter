import 'package:dream_small/src/pages/new_game.dart';
import 'package:flutter/material.dart';

class PlayerInputs extends StatefulWidget {
  const PlayerInputs(
      {super.key, required this.numberAmount, required this.onSubmit});

  final int numberAmount;
  final void Function(PlayerTicket) onSubmit;

  @override
  State<PlayerInputs> createState() => _PlayerInputsState();
}

class _PlayerInputsState extends State<PlayerInputs> {
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();

    var numberControllers =
        List.generate(widget.numberAmount, (index) => TextEditingController());
    var theme = Theme.of(context);

    var numberInputs = List.generate(widget.numberAmount, (index) {
      return TextField(
        controller: numberControllers.elementAt(index),
        decoration: InputDecoration(
            border: OutlineInputBorder(), label: Text("Number ${index + 1}.")),
      );
    });

    void collectInputAndSubmit() {
      var ticket = PlayerTicket(nameController.text,
          numberControllers.map((e) => int.tryParse(e.text) ?? 0).toList());
      widget.onSubmit(ticket);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        ...numberInputs.expand((element) => [element, SizedBox(height: 10)]),
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
                onPressed: collectInputAndSubmit,
                icon: Icon(Icons.send),
                label: Text("Submit player"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
