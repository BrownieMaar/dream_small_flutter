import 'package:flutter/material.dart';

class DreamSmallApp extends StatelessWidget {
  const DreamSmallApp({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    void startNewGame() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          String userInput = "";
          bool isValid =
              userInput.isNotEmpty && int.tryParse(userInput) != null;
          void onSubmit() {
            print("start game with $userInput numbers");
            Navigator.pop(context); // Close the dialog
            Navigator.pushNamed(context, "/game");
          }

          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('New game'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Specify how many numbers will players submit.'),
                  SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        userInput = value;
                        isValid = userInput.isNotEmpty &&
                            int.tryParse(userInput) != null;
                      });
                    },
                    onSubmitted: (value) {
                      if (isValid) onSubmit();
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("amount of numbers"),
                        errorText: int.tryParse(userInput) == null &&
                                userInput.isNotEmpty
                            ? "Provide a number"
                            : null),
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed:
                      isValid
                          ? onSubmit
                          : null,
                  child: Text('Start game'),
                ),
              ],
            );
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dream Small",
          style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    HomeScreenButton(
                        screenShare: 0.5,
                        buttonCallback: () => startNewGame(),
                        buttonLabel: "New Game"),
                    SizedBox(height: 10),
                    HomeScreenButton(
                        screenShare: 0.17,
                        buttonCallback: () => print("how to play"),
                        buttonLabel: "How to play"),
                    SizedBox(height: 10),
                    HomeScreenButton(
                        screenShare: 0.17,
                        buttonCallback: null,
                        buttonLabel: "About"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenButton extends StatelessWidget {
  const HomeScreenButton({
    super.key,
    required this.screenShare,
    required this.buttonCallback,
    required this.buttonLabel,
  });

  final double screenShare;
  final void Function()? buttonCallback;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * screenShare,
      width: MediaQuery.of(context).size.width,
      child: FilledButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: buttonCallback,
        child: Text(
          buttonLabel,
          style: TextStyle(fontSize: 38),
        ),
      ),
    );
  }
}
